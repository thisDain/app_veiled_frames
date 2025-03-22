import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:veiled_frames/core/enums/user_role.dart';
import 'package:veiled_frames/core/utils/api_response.dart';
import 'package:veiled_frames/core/utils/logger.dart';
import 'package:veiled_frames/core/utils/password_utils.dart';
import 'package:veiled_frames/features/customer/models/customer_model.dart';
import 'package:veiled_frames/features/employee/models/employee_model.dart';

class AuthService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  //sign in
  Future<ApiResponse> signIn({
    required String email,
    required String password,
    required UserRole role,
  }) async {
    try {
      final String table =
          role == UserRole.customer ? 'customers' : 'employees';
      final bool isCustomer = role == UserRole.customer;
      final String userRole = role == UserRole.customer ? "customer" : "artist";

      // Input validation
      if (email.isEmpty || password.isEmpty) {
        return ApiResponse.failure("Email and password cannot be empty.");
      }

      final userData =
          await _supabaseClient
              .from(table)
              .select(
                '${isCustomer ? "customer_id" : "emp_id"}, ${isCustomer ? "c_password" : "e_password"}, ${isCustomer ? "c_salt" : "e_salt"}',
              )
              .eq(isCustomer ? 'c_email' : 'e_email', email)
              .maybeSingle();

      if (userData == null) {
        return ApiResponse.failure("User not found.");
      }
      // verify password
      final String storedHashedPassword =
          userData[isCustomer ? 'c_password' : 'e_password'];
      final String storedSalt = userData[isCustomer ? 'c_salt' : 'e_salt'];

      if (hashPassword(password, storedSalt) != storedHashedPassword) {
        return ApiResponse.failure("Incorrect password.");
      }

      // Store session securely
      await _storage.write(key: 'user_email', value: email);
      await _storage.write(key: 'user_role', value: userRole);

      return ApiResponse.success(null, message: "Login successful!");

      // check if user is customer
    } catch (e) {
      return ApiResponse.failure("An error occurred while logging in.");
    }
  }

  //sign up
  Future<ApiResponse> signUp({
    required String email,
    required UserRole role,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final String table =
          role == UserRole.customer ? 'customers' : 'employees';
      final String userRole = role == UserRole.customer ? "customer" : "artist";
      final bool isCustomer = role == UserRole.customer;

      // Input validation
      if (email.isEmpty || password.isEmpty) {
        return ApiResponse.failure("Email and password cannot be empty.");
      }

      // hash password
      final String salt = generateSalt();
      final hashedPassword = hashPassword(password, salt);

      final Map<String, dynamic> data = {
        isCustomer ? 'c_email' : 'e_email': email,
        isCustomer ? 'c_password' : 'e_password': hashedPassword,
        isCustomer ? 'c_fname' : 'e_fname': firstName,
        isCustomer ? 'c_lname' : 'e_lname': lastName,
        isCustomer ? 'c_salt' : 'e_salt': salt,
        isCustomer ? 'c_role' : 'e_role': userRole,
        isCustomer ? 'c_created_at' : 'e_hiredate':
            DateTime.now().toIso8601String(),
      };

      await _supabaseClient.from(table).insert(data);

      logger.i("User successfully created in $table");

      await _storage.write(key: 'user_email', value: email);
      await _storage.write(key: 'user_role', value: userRole);

      return ApiResponse.success("Created user successfully");
    } catch (e) {
      logger.e(e);
      if (e.toString().contains("duplicate key value")) {
        return ApiResponse.failure("Email is already in use.");
      }
      return ApiResponse.failure("An error occurred while creating user.");
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

  // Get user on db
  Future<ApiResponse> getUserByEmail({
    required String email,
    required String role,
  }) async {
    // Input validation
    if (email.isEmpty || role.isEmpty) {
      return ApiResponse.failure("Email and Role cannot be empty.");
    }

    final bool isCustomer = role == UserRole.customer.name;
    final String table = isCustomer ? 'customers' : 'employees';
    final String emailField = isCustomer ? 'c_email' : 'e_email';

    try {
      final response =
          await _supabaseClient
              .from(table)
              .select()
              .eq(emailField, email)
              .maybeSingle(); // ✅ Prevent crash if user doesn't exist

      if (response == null) {
        return ApiResponse.failure("User not found");
      }

      final user =
          isCustomer
              ? CustomerModel.fromJson(response)
              : EmployeeModel.fromJson(response);

      return ApiResponse.success(user);
    } catch (error) {
      logger.e('Error fetching user: $error'); // Debug
      return ApiResponse.failure("Error fetching user: $error");
    }
  }

  //logout
  Future<ApiResponse> logout() async {
    try {
      await _storage.deleteAll();
      return ApiResponse.success("User logged out successfully.");
    } catch (e) {
      return ApiResponse.failure("Error logging out.");
    }
  }
}
