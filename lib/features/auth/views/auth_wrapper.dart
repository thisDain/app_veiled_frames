import 'package:flutter/material.dart';
import 'package:veiled_frames/core/enums/user_role.dart';
import 'package:veiled_frames/features/auth/data/auth_service.dart';
import 'package:veiled_frames/features/auth/views/login.dart';
import 'package:veiled_frames/features/customer/views/customer_dashboard.dart';
import 'package:veiled_frames/features/employee/views/employee_main.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  final AuthService _authService = AuthService();

  Future<Widget> _getInitialScreen() async {
    final sessionData = await _authService.getUserSessionData();
    final String? email = sessionData['email'];
    final String? role = sessionData['role'];

    if (email == null || email.isEmpty || role == null || role.isEmpty) {
      return Login();
    }

    if (role == UserRole.customer.name) {
      return CustomerDashboard();
    } else if (role == UserRole.artist.name) {
      return ArtistMain();
    } else {
      return Login();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: _getInitialScreen(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasData) {
          return snapshot.data!;
        } else {
          return Login();
        }
      },
    );
  }
}
