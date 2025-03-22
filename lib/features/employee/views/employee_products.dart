import 'package:flutter/material.dart';
import 'package:veiled_frames/core/constants/app_colors.dart';
import 'package:veiled_frames/core/constants/products.dart';

class ArtistProducts extends StatefulWidget {
  const ArtistProducts({super.key});

  @override
  State<ArtistProducts> createState() => _ArtistProductsState();
}

class _ArtistProductsState extends State<ArtistProducts> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Products',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFEE4540),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: AppColors.fieryRed,
                  ), // Change icon color if needed
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      AppColors.background,
                    ), // Set background color
                    minimumSize: WidgetStateProperty.all(
                      const Size(48, 48),
                    ), // Make it square
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ), // Rounded square
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(child: _productsList()),
          ],
        ),
      ),
    );
  }

  Widget _productsList() {
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
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      controller: _scrollController,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return Container(
                          height: 100,
                          margin: EdgeInsets.only(bottom: 8, right: 30),
                          decoration: BoxDecoration(
                            color: Color(0xFF2D142C),
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(10),
                              left: Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons.image,
                                    size: 30,
                                    color: AppColors.background,
                                  ),
                                ),
                                SizedBox(width: 18),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product['prod_name']!,
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Product No.: ",
                                            style: TextStyle(
                                              color: AppColors.white
                                                  .withOpacity(0.5),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "${product['product_id']!}",
                                            style: TextStyle(
                                              color:
                                                  AppColors.white, // No opacity
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Medium: ",
                                            style: TextStyle(
                                              color: AppColors.white
                                                  .withOpacity(0.5),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "${product['prod_medium']!}",
                                            style: TextStyle(
                                              color:
                                                  AppColors.white, // No opacity
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Dimensions: ",
                                            style: TextStyle(
                                              color: AppColors.white
                                                  .withOpacity(0.5),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                "${product['prod_dimensions']!}",
                                            style: TextStyle(
                                              color:
                                                  AppColors.white, // No opacity
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Stock: ",
                                            style: TextStyle(
                                              color: AppColors.white
                                                  .withOpacity(0.5),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                "${product['prod_stock_quantity']!}",
                                            style: TextStyle(
                                              color:
                                                  AppColors.white, // No opacity
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () => {},
                                      icon: Icon(
                                        Icons.edit_square,
                                        color: AppColors.fieryRed,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      "₱ ${product['prod_price']}.00",
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
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
