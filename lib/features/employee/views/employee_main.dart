import 'package:flutter/material.dart';
import 'package:veiled_frames/core/constants/app_colors.dart';
import 'package:veiled_frames/features/employee/views/employee_dashboard.dart';
import 'package:veiled_frames/features/employee/views/employee_orders.dart';
import 'package:veiled_frames/features/employee/views/employee_products.dart';
import 'package:veiled_frames/features/widgets/global_appbar.dart';

class ArtistMain extends StatefulWidget {
  const ArtistMain({super.key});

  @override
  State<ArtistMain> createState() => _ArtistMainState();
}

class _ArtistMainState extends State<ArtistMain> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    ArtistDashboard(),
    ArtistProducts(),
    ArtistOrders(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppbar(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.whiteShade,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Orders',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFEE4540),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
