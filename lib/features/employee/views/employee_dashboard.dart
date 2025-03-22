import 'package:flutter/material.dart';
import 'package:veiled_frames/core/constants/app_colors.dart';
import 'package:veiled_frames/features/auth/data/auth_service.dart';
import 'package:veiled_frames/features/auth/views/login.dart';
import 'package:veiled_frames/features/employee/views/employee_orders.dart';
import 'package:veiled_frames/features/employee/views/employee_products.dart';
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
  final ScrollController _scrollController =
      ScrollController(); // Create controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w500,
                color: Color(0xFFEE4540),
              ),
            ),
            SizedBox(height: 16),
            _revenueCard(totalRevenue, revenueChange),
            SizedBox(height: 16),
            _ordersAndProductsRow(totalOrders, totalProducts),
            SizedBox(height: 16),
            Expanded(child: _bestSellingProductsCard()),
          ],
        ),
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
    // Example data for the product rows
    final List<Map<String, String>> products = [
      {'name': 'The Sunflower', 'orders': '17', 'sales': '15'},
      {'name': 'The Rose', 'orders': '12', 'sales': '10'},
      {'name': 'The Tulip', 'orders': '8', 'sales': '7'},
      {'name': 'The Daisy', 'orders': '6', 'sales': '5'},
      {'name': 'The Lily', 'orders': '5', 'sales': '4'},
      {'name': 'The Orchid', 'orders': '4', 'sales': '3'},
      {'name': 'The Carnation', 'orders': '3', 'sales': '2'},
      {'name': 'The Iris', 'orders': '2', 'sales': '1'},
      {'name': 'The Peony', 'orders': '1', 'sales': '1'},
      {'name': 'The Hydrangea', 'orders': '1', 'sales': '1'},
      {'name': 'The Lavender', 'orders': '1', 'sales': '1'},
      {'name': 'The Marigold', 'orders': '1', 'sales': '1'},
      {'name': 'The Poppy', 'orders': '1', 'sales': '1'},
      {'name': 'The Snapdragon', 'orders': '1', 'sales': '1'},
      {'name': 'The Zinnia', 'orders': '1', 'sales': '1'},
    ];

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
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
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
          // Use ListView for the product rows
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 12, // Width of the scrollbar background
                      decoration: BoxDecoration(
                        color:
                            AppColors.rosewoodMauve, // Track background color
                        borderRadius: BorderRadius.circular(
                          6,
                        ), // Adjust for rounded edges
                      ),
                    ),
                  ),
                ),
                Scrollbar(
                  thickness: 8, // Scrollbar thickness
                  radius: const Radius.circular(10), // Rounded corners
                  thumbVisibility: true, // Always visible
                  interactive: true, // Draggable
                  trackVisibility: true,
                  scrollbarOrientation: ScrollbarOrientation.right,
                  controller: _scrollController,
                  child: Theme(
                    data: ThemeData(
                      scrollbarTheme: ScrollbarThemeData(
                        thumbColor: WidgetStateProperty.all(
                          AppColors.dustyBlush,
                        ), // Change color here
                        trackColor: WidgetStateProperty.all(
                          AppColors.dustyBlush,
                        ), // Track color
                        trackVisibility: WidgetStateProperty.all(true),
                      ),
                    ),
                    child: ListView.builder(
                      controller: _scrollController,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 8, right: 30),
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
                                    '${index + 1}',
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
                                    product['name']!,
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
                                    product['orders']!,
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
                                    product['sales']!,
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
                        );
                      },
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
