import 'package:flutter/material.dart';
import 'package:veiled_frames/core/constants/app_colors.dart';
import 'package:veiled_frames/core/constants/products.dart';

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
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
              _bestSellingProductsCard(), // Removed Expanded here
            ],
          ),
        ),
      ),
    );
  }

  Widget _bestSellingProductsCard() {
    final List<Map<String, String>> products = [
      {'name': 'The Sunflower', 'orders': '17', 'sales': '15'},
      {'name': 'The Rose', 'orders': '12', 'sales': '10'},
      {'name': 'The Tulip', 'orders': '8', 'sales': '7'},
      {'name': 'The Daisy', 'orders': '6', 'sales': '5'},
      {'name': 'The Lily', 'orders': '5', 'sales': '4'},
      {'name': 'The Orchid', 'orders': '4', 'sales': '3'},
      {'name': 'The Carnation', 'orders': '3', 'sales': '2'},
      {'name': 'The Iris', 'orders': '2', 'sales': '1'},
    ];

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteShade,
        borderRadius: BorderRadius.circular(20),
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
                    ),
                  ),
                  Text(
                    'Month - (March)',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xFFE09398),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: <Widget>[
                Text(
                  "#",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.dustyBlush,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(width: 40),
                Text(
                  "Name",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.dustyBlush,
                  ),
                ),

                SizedBox(width: 140),
                Text(
                  "Orders",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.dustyBlush,
                  ),
                ),
                SizedBox(width: 40),
                Text(
                  "Sales",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.dustyBlush,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),

          // Scrollable ListView inside a SizedBox
          SizedBox(
            height: 300, // Set a fixed height
            child: Scrollbar(
              thickness: 8,
              radius: const Radius.circular(10),
              thumbVisibility: true,
              controller: _scrollController,
              child: ListView.builder(
                controller: _scrollController,
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
                                color: AppColors.whiteShade,
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
    );
  }

  Widget _revenueCard(String totalRevenue, String revenueChange) {
    return Container(
      height: 150,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.plumRed,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                pesoSign,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 36,
                  color: Color(0xFFEE4540),
                ),
              ),
              Text(
                totalRevenue,
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.w600,
                  color: AppColors.whiteShade,
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
                  color: AppColors.whiteShade,
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
          child: _infoCard(
            'Total Orders',
            '$totalOrders',
            Icons.shopping_cart_outlined,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: _infoCard(
            'Total Products',
            '$totalProducts',
            Icons.shopping_bag_outlined,
          ),
        ),
      ],
    );
  }

  Widget _infoCard(String title, String value, IconData icon) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteShade,
        borderRadius: BorderRadius.circular(20),
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
                fontSize: 64,
                fontWeight: FontWeight.w500,
                color: AppColors.plumRed,
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
}
