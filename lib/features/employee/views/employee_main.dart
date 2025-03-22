import 'package:flutter/material.dart';
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
  int _selectedIndex = 0; // Default index for the dashboard

  // List of screens to display based on the selected index
  final List<Widget> _screens = [
    ArtistDashboard(), // Index 0: Dashboard
    ArtistProducts(), // Index 1: Products
    ArtistOrders(), // Index 2: Orders
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppbar(),
      body: _screens[_selectedIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Orders',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFEE4540),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped, // Handle item taps
      ),
    );
  }
}
