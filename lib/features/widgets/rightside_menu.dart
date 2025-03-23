import 'package:flutter/material.dart';
import 'package:veiled_frames/core/constants/app_colors.dart';
import 'package:veiled_frames/features/auth/data/auth_service.dart';
import 'package:veiled_frames/features/auth/models/user_model.dart';
import 'package:veiled_frames/features/auth/views/login.dart';
import 'package:veiled_frames/features/widgets/user_edit_profile.dart';

class RightSideMenu extends StatefulWidget {
  const RightSideMenu({super.key});

  @override
  State<RightSideMenu> createState() => _RightSideMenuState();
}

class _RightSideMenuState extends State<RightSideMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  UserModel? userData;
  bool isLoading = true;

  final authService = AuthService();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = Tween<Offset>(
      begin: Offset(1.0, 0.0), // Start off-screen (right)
      end: Offset(0.0, 0.0), // Slide into view
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();

    _fetchUserData();
  }

  void _fetchUserData() async {
    setState(() {
      isLoading = true; // Show loading indicator
    });

    Map<String, String?> sessionData = await authService.getUserSessionData();

    if (sessionData['email'] == null || sessionData['role'] == null) {
      setState(() {
        userData = null;
        isLoading = false;
      });
      return;
    }

    final response = await authService.getUserByEmail(
      email: sessionData['email']!,
      role: sessionData['role']!,
    );

    if (response.success) {
      setState(() {
        userData = response.data; // CustomerModel or EmployeeModel
        isLoading = false;
      });
    } else {
      setState(() {
        userData = null;
        isLoading = false;
      });
    }
  }

  void handleLogout() async {
    final response = await authService.logout();
    if (response.success) {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context), // Close menu when clicking outside
      child: Material(
        color: Colors.black54, // Semi-transparent background
        child: Align(
          alignment: Alignment.centerRight,
          child: SlideTransition(
            position: _animation,
            child: Container(
              width: 300,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: AppColors.appBarBackground,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isLoading
                      ? Center(
                        child: CircularProgressIndicator(),
                      ) // Show loader
                      : ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            color: AppColors.fieryRed,
                            size: 30,
                          ),
                        ),
                        title: Text(
                          '${userData?.firstName ?? ''} ${userData?.lastName ?? ''}'
                              .trim(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Tooltip(
                          message:
                              userData?.email ??
                              "No email available", // Full email
                          child: Text(
                            userData?.email ?? "No email available",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ),

                  // Other menu items
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ), // Add padding
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserEditProfile(),
                          ),
                        );
                      },
                      child: Container(
                        width:
                            double.infinity, // Make the button take full width
                        height: 30, // Set a fixed height for the button
                        decoration: BoxDecoration(
                          color: AppColors.fieryRed, // Use your fieryRed color
                        ),
                        child: Center(
                          child: Text(
                            "Edit Profile",
                            style: TextStyle(
                              color: Colors.white, // Text color
                              fontSize: 16, // Text size
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Spacer(),

                  // Centered Logout Button
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      alignment:
                          Alignment.center, // Center the Row horizontally

                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          handleLogout();
                        },
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .center, // Center the content inside the Row
                          children: [
                            Icon(
                              Icons.logout,
                              color: Colors.white,
                            ), // Logout icon
                            SizedBox(
                              width: 8,
                            ), // Add spacing between icon and text
                            Text(
                              "Logout",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
