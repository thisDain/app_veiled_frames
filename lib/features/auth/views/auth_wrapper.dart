import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:veiled_frames/core/enums/user_role.dart';
import 'package:veiled_frames/features/auth/data/auth_service.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  final AuthService _authService = AuthService();

  Future<Widget> _getInitialScreen() async {
    final sessionData = await _authService.getUserSessionData();
    final String? email = sessionData['user_email'];
    final String? role = sessionData['user_role'];

    if (email == null || email.isEmpty || role == null || role.isEmpty) {
      return Text("Login"); //TODO: replace Login View
    }

    if (role == UserRole.customer.name.toUpperCase()) {
      return Text("Customer"); //TODO: replace Customer View
    } else if (role == UserRole.artist.name.toUpperCase()) {
      return Text("Artist"); //TODO: replace Artist View
    } else {
      return Text("Login"); //TODO: replace Login View
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
          return Text("Login"); //TODO: replace Login View
        }
      },
    );
  }
}
