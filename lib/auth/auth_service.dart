import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  //sign in
  Future<void> signIn() async {
    print("signed in");
  }
  //sign up

  Future<void> signUp() async {
    print("signed up");
    final hello = "strig";
  }

  //logout

  Future<void> logout() async {
    print("logged out");
  }
}
