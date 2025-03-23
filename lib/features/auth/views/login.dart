// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:veiled_frames/core/constants/app_colors.dart';
import 'package:veiled_frames/core/enums/user_role.dart';
import 'package:veiled_frames/features/auth/data/auth_service.dart';
import 'package:veiled_frames/features/auth/views/signup.dart';
import 'package:veiled_frames/features/customer/views/customer_dashboard.dart';
import 'package:veiled_frames/features/employee/views/employee_dashboard.dart';
import 'package:veiled_frames/features/employee/views/employee_main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
        child: loginBody(),
      ),
    );
  }

  final authService = AuthService();
  final String logoPath = "assets/images/logo_main.png";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  UserRole selectedRole = UserRole.customer;
  bool _obscureText = true;

  void handleLogin() async {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    try {
      final response = await authService.signIn(
        email: email,
        password: password,
        role: selectedRole,
      );

      if (response.success) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.message),
              backgroundColor: Colors.green,
            ),
          );

          if (selectedRole == UserRole.customer) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => CustomerDashboard()),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ArtistMain()),
            );
          }
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("An error has occured"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Widget loginBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              logoPath,
              width: 68, // Adjust width as needed
              height: 68, // Adjust height as needed
              fit: BoxFit.contain,
            ),
            Text(
              "VEILED\nFRAMES",
              style: TextStyle(
                fontFamily: "Lisu Bosa",
                fontWeight: FontWeight.w500,
                fontSize: 32.0,
                color: AppColors.white,
                height: 0.9,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(50.0),
          child: Text(
            "Welcome",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.fieryRed,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              fontSize: 32,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Log In to Account",
                  style: TextStyle(
                    color: AppColors.whiteShade,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: 24.0,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Log in with username and password",
                  style: TextStyle(
                    color: AppColors.whiteShade.withOpacity(0.5),
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        loginForm(),
      ],
    );
  }

  Widget loginForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
      child: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(
                color: AppColors.white.withOpacity(0.2),
                fontWeight: FontWeight.normal,
                fontSize: 16.0,
              ),
              floatingLabelStyle: TextStyle(
                color: AppColors.white, // Fully visible when focused
                fontWeight: FontWeight.normal,
                fontSize: 16.0,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.whiteShade, width: 1.0),
                borderRadius: BorderRadius.circular(
                  10.0,
                ), // Less rounded, more like a soft rectangle
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.whiteShade, width: 1.0),
                borderRadius: BorderRadius.circular(
                  10.0,
                ), // Same rounded corners when focused
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 18.0,
                horizontal: 14.0,
              ), // Spacing inside the field
            ),
            style: TextStyle(
              color: AppColors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _passwordController,
            obscureText: _obscureText,
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(
                fontFamily: "Poppins",
                color: AppColors.white.withOpacity(0.2),
                fontWeight: FontWeight.w400,

                fontSize: 16.0,
              ),
              floatingLabelStyle: TextStyle(
                fontFamily: "Poppins",
                color: AppColors.white, // Fully visible when focused
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.whiteShade, width: 1.0),
                borderRadius: BorderRadius.circular(
                  10.0,
                ), // Less rounded, more like a soft rectangle
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.whiteShade, width: 1.0),
                borderRadius: BorderRadius.circular(
                  10.0,
                ), // Same rounded corners when focused
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 18.0,
                horizontal: 14.0,
              ), // Spacing inside the field
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.whiteShade,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText; // Toggle visibility
                  });
                },
              ),
            ),
            style: TextStyle(
              color: AppColors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
            ),
            keyboardType: TextInputType.visiblePassword,
          ),
          SizedBox(height: 16.0),
          DropdownButtonFormField<UserRole>(
            value: selectedRole,
            decoration: InputDecoration(
              labelText: 'Customer or Artist?',
              labelStyle: TextStyle(
                fontFamily: "Poppins",
                color: AppColors.white.withOpacity(0.2),
                fontWeight: FontWeight.normal,
                fontSize: 16.0,
              ),
              floatingLabelStyle: TextStyle(
                fontFamily: "Poppins",
                color: AppColors.white,
                fontWeight: FontWeight.normal,
                fontSize: 16.0,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.whiteShade, width: 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.whiteShade, width: 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 18.0,
                horizontal: 14.0,
              ),
            ),
            dropdownColor: AppColors.darkMagenta,
            style: TextStyle(
              color: AppColors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
            ),
            icon: Icon(
              Icons.keyboard_arrow_down, // Replace with any icon you want
              color: AppColors.fieryRed,
              size: 24, // Customize the icon size
            ),
            items:
                UserRole.values.map((UserRole role) {
                  return DropdownMenuItem<UserRole>(
                    value: role,
                    child: Text(
                      role.name[0].toUpperCase() + role.name.substring(1),
                    ),
                  );
                }).toList(),
            onChanged: (UserRole? value) {
              setState(() {
                selectedRole = value!;
              });
            },
          ),
          SizedBox(height: 12.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                handleLogin();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.whiteShade,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ), // 10px border radius
                ),
                textStyle: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              child: Text(
                'LOG IN',
                style: TextStyle(color: AppColors.darkMagenta),
              ),
            ),
          ),
          SizedBox(height: 24.0),
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: Colors.white, // Line color
                  thickness: 1, // Line thickness
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.whiteShade),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  'or',
                  style: TextStyle(
                    color: AppColors.whiteShade, // Text color
                    fontWeight: FontWeight.w400,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  color: Colors.white, // Line color
                  thickness: 1, // Line thickness
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Need an account? ",
                  style: TextStyle(
                    color: AppColors.white.withOpacity(0.75),
                    fontFamily: "Poppins",
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to Sign Up screen or handle sign-up action
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero, // Removes default padding
                    minimumSize: Size(0, 0), // Ensures no extra space
                    tapTargetSize:
                        MaterialTapTargetSize.shrinkWrap, // Shrinks touch area
                  ),
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(
                      color: AppColors.secondary, // Custom color
                      fontFamily: "Poppins",
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
