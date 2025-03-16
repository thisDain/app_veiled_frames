import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:veiled_frames/core/enums/user_role.dart';
import 'package:veiled_frames/core/utils/logger.dart';
import 'package:veiled_frames/core/utils/password_utils.dart';

class AuthService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  //sign in
  Future<void> signIn({
    required String email,
    required String password,
    required UserRole role,
  }) async {
    try {
      final String table =
          role == UserRole.customer ? 'customers' : 'employees';
      final bool isCustomer = role == UserRole.customer;
      final String userRole = role == UserRole.customer ? "CUSTOMER" : "ARTIST";

      // Input validation
      if (email.isEmpty || password.isEmpty) {
        throw Exception("Email and password cannot be empty.");
      }

      final userData =
          await _supabaseClient
              .from(table)
              .select(
                '${isCustomer ? "customer_id" : "emp_id"}, ${isCustomer ? "c_password" : "e_password"}',
              )
              .eq(isCustomer ? 'c_email' : 'e_email', email)
              .maybeSingle();

      if (userData == null) {
        throw Exception("User not found.");
      }

      // verify password
      final String hashedPassword =
          userData[isCustomer ? 'c_password' : 'e_password'];

      if (!verifyPassword(password, hashedPassword)) {
        throw Exception("Incorrect password.");
      }

      // Store session securely
      await _storage.write(key: 'user_email', value: email);
      await _storage.write(key: 'user_role', value: userRole);

      logger.i("✅ Login successful as ${isCustomer ? "Customer" : "Employee"}");

      // check if user is customer
    } catch (e, stacktrace) {
      logger.e("Error signing up: $e", error: e, stackTrace: stacktrace);
      rethrow;
    }
  }

  //sign up
  Future<void> signUp({
    required String email,
    required UserRole role,
    required String password,
  }) async {
    try {
      final String table =
          role == UserRole.customer ? 'customers' : 'employees';
      final String userRole = role == UserRole.customer ? "CUSTOMER" : "ARTIST";
      final bool isCustomer = role == UserRole.customer;

      // Input validation
      if (email.isEmpty || password.isEmpty) {
        throw Exception("Email and password cannot be empty.");
      }

      // hash password
      final String salt = generateSalt();
      final hashedPassword = hashPassword(password, salt);

      final Map<String, dynamic> data = {
        isCustomer ? 'c_email' : 'e_email': email,
        isCustomer ? 'c_password' : 'e_password': hashedPassword,
        isCustomer ? 'c_role' : 'e_role': userRole,
        isCustomer ? 'c_created_at' : 'e_hiredate': DateTime.now(),
      };

      final response = await _supabaseClient.from(table).insert(data);

      if (response.error != null) {
        throw Exception("Supabase error: ${response.error!.message}");
      }

      logger.i("User successfully created in $table");

      await _storage.write(key: 'user_email', value: email);
      await _storage.write(key: 'user_role', value: userRole);

      logger.i("✅ User session stored");
    } catch (e, stacktrace) {
      logger.e("Error signing up: $e", error: e, stackTrace: stacktrace);
      rethrow;
    }
  }

  // is user logged in
  Future<bool> isLoggedIn() async {
    String? email = await _storage.read(key: 'user_email');
    return email != null;
  }

  // Get Logged In User Data on session storage
  Future<Map<String, String?>> getUserSessionData() async {
    String? email = await _storage.read(key: 'user_email');
    String? role = await _storage.read(key: 'user_role');
    return {'email': email, 'role': role};
  }

  //logout
  Future<void> logout() async {
    try {
      await _storage.deleteAll();
      logger.i("✅ User logged out successfully");
    } catch (e) {
      logger.e("❌ Error logging out: $e");
    }
  }
}
