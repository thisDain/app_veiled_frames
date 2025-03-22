import 'package:flutter/material.dart';
import 'package:veiled_frames/core/constants/app_colors.dart';
import 'package:veiled_frames/features/auth/data/auth_service.dart';
import 'package:veiled_frames/features/auth/views/login.dart';
import 'package:veiled_frames/features/widgets/global_appbar.dart';
import 'package:veiled_frames/features/widgets/rightside_menu.dart';

class ArtistDashboard extends StatefulWidget {
  const ArtistDashboard({super.key});

  @override
  State<ArtistDashboard> createState() => _ArtistDashboardState();
}

class _ArtistDashboardState extends State<ArtistDashboard> {
  String totalRevenue = '0.00';
  String revenueChange = '0%';
  int totalOrders = 0;
  int totalProducts = 0;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final authService = AuthService();

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
    return Scaffold(
      appBar: GlobalAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFEE4540),
                ),
              ),
              SizedBox(height: 16),
              _revenueCard(totalRevenue, revenueChange),
              SizedBox(height: 16),
              _ordersAndProductsRow(totalOrders, totalProducts),
              SizedBox(height: 16),
              _bestSellingProductsCard(),
            ],
          ),
        ),
      ),
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
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _revenueCard(String totalRevenue, String revenueChange) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF801336),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '₱',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 36,
                  color: Color(0xFFEE4540),
                ),
              ),
              Text(
                totalRevenue,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFFAFAF0),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Revenue',
                style: TextStyle(
                  color: Color(0xFFFAFAF0),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(revenueChange, style: TextStyle(color: Color(0xFFD6B5B8))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _ordersAndProductsRow(totalOrders, totalProducts) {
    return Row(
      children: [
        Expanded(
          child: _infoCard('Total Orders', '$totalOrders', Icons.shopping_cart),
        ),
        SizedBox(width: 16),
        Expanded(
          child: _infoCard(
            'Total Products',
            '$totalProducts',
            Icons.inventory_2,
          ),
        ),
      ],
    );
  }

  Widget _infoCard(String title, String value, IconData icon) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          Align(
            alignment: Alignment.centerLeft,
            child: Icon(icon, size: 40, color: Color(0xFFEE4540)),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Color(0xFF801336),
              ),
            ),
          ),
          // Title (e.g., "Total Orders")
          Align(
            alignment: Alignment.centerLeft,
            child: Text(title, style: TextStyle(color: Color(0xFF801336))),
          ),
        ],
      ),
    );
  }

  Widget _bestSellingProductsCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.star_border, color: Color(0xFFEE4540)),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Best Selling Products',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF801336),
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(height: 1),
                  Text(
                    'Month - (March)',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xFFE09398),
                      fontFamily: 'Poppins',
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    '#',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFD4606D),
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Name',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFD4606D),
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Orders',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFD4606D),
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Sales',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFD4606D),
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF2D142C),
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(10),
                left: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      '1',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFC0B8AD),
                        fontFamily: 'Poppins',
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'The Sunflower',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFAFAF0),
                        fontFamily: 'Poppins',
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      '17',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFEE4540),
                        fontFamily: 'Poppins',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      '15',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFEE4540),
                        fontFamily: 'Poppins',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
