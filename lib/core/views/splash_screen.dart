import 'package:flutter/material.dart';
import 'package:veiled_frames/features/auth/views/auth_wrapper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToAuthWrapper();
  }

  Future<void> _navigateToAuthWrapper() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => AuthWrapper()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF510A32), Color(0xFF2D142C)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo_main.png",
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
