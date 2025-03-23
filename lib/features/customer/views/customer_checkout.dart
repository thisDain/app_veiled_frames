import 'package:flutter/material.dart';
import 'package:veiled_frames/core/constants/app_colors.dart';

class CustomerCheckout extends StatefulWidget {
  const CustomerCheckout({super.key});

  @override
  State<CustomerCheckout> createState() => _CustomerCheckoutState();
}

class _CustomerCheckoutState extends State<CustomerCheckout> {
  final List<Map<String, dynamic>> paintings = [
    {
      "title": "Under Verdant Shadows",
      "artist": "Victoria Smith",
      "category": "Oil Painting",
      "medium": "Hahnemühle Hot-Pressed Watercolor Paper",
      "dimensions": "11.8\" × 15.7\"",
      "price": 10000.00,
      "imageUrl": "assets/images/recommended/recommended.png",
    },
    {
      "title": "Serene Waters",
      "artist": "Daniel Everett",
      "category": "Acrylic Painting",
      "medium": "Canvas",
      "dimensions": "20\" × 30\"",
      "price": 12000.00,
      "imageUrl": "assets/images/serene_waters.jpg",
    },
  ];

  double totalPrice = 0;
  int totalQuantity = 0;

  @override
  void initState() {
    super.initState();
    totalPrice = paintings.fold(0, (sum, item) => sum + item["price"]);
    totalQuantity = paintings.length;
  }

  final List<String> deliveryModes = ["STANDARD DELIVERY", "PICK UP"];
  final List<String> paymentModes = ["CREDIT CARD", "MAYA", "GCASH"];

  String selectedDeliveryMode = "STANDARD DELIVERY";
  String selectedPaymentMode = "CREDIT CARD";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D142C),
      appBar: AppBar(
        toolbarHeight: 75.0,
        backgroundColor: Color(0xFF510A32),
        iconTheme: IconThemeData(color: AppColors.fieryRed),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Checkout",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Color(0xFFFAFAF0),
              ),
            ),
          ],
        ),
      ),
      body: _checkoutBody(),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.appBarBackground,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.fieryRed,
                  side: const BorderSide(color: AppColors.fieryRed, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 175.0,
                    vertical: 20.0,
                  ),
                  minimumSize: const Size(0, 0),
                ),
                child: const Text(
                  "Check out",
                  style: TextStyle(
                    color: AppColors.whiteShade,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _checkoutBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white, // Background color
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: AppColors.fieryRed,
                        size: 35,
                      ),
                      SizedBox(width: 8), // Space between icon and text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .center, // Align items properly
                            children: [
                              Text(
                                "Address",
                                style: TextStyle(
                                  color: AppColors.fieryRed,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: 6,
                              ), // Space between text and capsule
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      AppColors.fieryRed, // Capsule background
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  "Home",
                                  style: TextStyle(
                                    color: Colors.white, // Font color
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '9606 Alc Park, Mari Lakeview',
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              color: AppColors.background,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // Add navigation logic here
                    },
                    child: Container(
                      padding: EdgeInsets.all(6), // Padding for better tap area
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, // Makes it circular
                        color:
                            Colors.transparent, // Keeps background transparent
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.fieryRed,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          ListView.builder(
            shrinkWrap: true,
            physics:
                NeverScrollableScrollPhysics(), // Prevents scroll conflicts
            itemCount: paintings.length,
            itemBuilder: (context, index) {
              final painting = paintings[index];
              final imageUrl = painting["imageUrl"];

              return Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 142,
                        height: 188,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[300], // Placeholder background
                        ),
                        child:
                            (imageUrl != null && imageUrl.isNotEmpty)
                                ? ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    imageUrl,
                                    width: 142,
                                    height: 188,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Center(
                                        child: Icon(
                                          Icons.image_not_supported,
                                          size: 50,
                                          color:
                                              Colors
                                                  .grey[600], // Placeholder icon
                                        ),
                                      );
                                    },
                                  ),
                                )
                                : Center(
                                  child: Icon(
                                    Icons.image,
                                    size: 50,
                                    color:
                                        Colors
                                            .grey[600], // Placeholder for missing images
                                  ),
                                ),
                      ),
                      SizedBox(width: 9),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              painting["title"],
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.background,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Product Details",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: AppColors.background,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Divider(color: AppColors.background),
                            detailRow(label: "Title", value: painting["title"]),
                            detailRow(
                              label: "Artist",
                              value: painting["artist"],
                            ),
                            detailRow(
                              label: "Category",
                              value: painting["category"],
                            ),
                            detailRow(
                              label: "Medium",
                              value: painting["medium"],
                            ),
                            detailRow(
                              label: "Dimensions",
                              value: painting["dimensions"],
                            ),
                            SizedBox(height: 12),
                            detailRow(
                              label: "Price",
                              value: painting["price"],
                              isPrice: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white, // Background color
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.delivery_dining,
                        color: AppColors.fieryRed,
                        size: 15,
                      ),
                      Text(
                        "Mode of Delivery",
                        style: TextStyle(
                          color: AppColors.crimsonWine,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:
                        deliveryModes.map((mode) {
                          bool isSelected = mode == selectedDeliveryMode;
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedDeliveryMode = mode;
                                });
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10,
                                ),
                                backgroundColor:
                                    isSelected
                                        ? AppColors.fieryRed.withOpacity(0.75)
                                        : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(
                                    color: AppColors.gunMetalGray.withOpacity(
                                      0.5,
                                    ),
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Text(
                                mode,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      isSelected
                                          ? Colors.white
                                          : AppColors.fieryRed,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                  SizedBox(height: 11),
                  Row(
                    children: [
                      Icon(
                        Icons.credit_card,
                        color: AppColors.fieryRed,
                        size: 15,
                      ),
                      Text(
                        "Mode of Payment",
                        style: TextStyle(
                          color: AppColors.crimsonWine,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:
                        paymentModes.map((mode) {
                          bool isSelected = mode == selectedPaymentMode;
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedPaymentMode = mode;
                                });
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10,
                                ),
                                backgroundColor:
                                    isSelected
                                        ? AppColors.fieryRed.withOpacity(0.75)
                                        : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(
                                    color: AppColors.gunMetalGray.withOpacity(
                                      0.5,
                                    ),
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Text(
                                mode,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      isSelected
                                          ? Colors.white
                                          : AppColors.fieryRed,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white, // Background color
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Summary",
                    style: TextStyle(
                      color: AppColors.crimsonWine,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  detailRow(
                    label: "Price",
                    value: "₱${totalPrice.toStringAsFixed(2)}",
                    isSummary: true,
                  ),
                  detailRow(
                    label: "Quantity",
                    value: "$totalQuantity",
                    isSummary: true,
                  ),
                  Divider(color: AppColors.background),
                  detailRow(
                    label: "Total",
                    value: totalPrice.toStringAsFixed(2),
                    isSummary: true,
                    isPrice: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget detailRow({
    required String label,
    required dynamic value,
    bool isPrice = false,
    bool isSummary = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Aligns text properly
        children: [
          SizedBox(
            width: 80, // Adjust width to align all labels
            child: Text(
              label,
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w600,
                color:
                    isSummary && isPrice
                        ? AppColors.fieryRed
                        : AppColors.background,
              ),
            ),
          ),
          if (!isSummary) SizedBox(width: 100),
          if (isSummary) Spacer(),
          Expanded(
            child: Align(
              alignment:
                  isSummary ? Alignment.centerRight : Alignment.centerLeft,
              child: Text(
                isPrice ? "₱${value.toString()}" : value.toString(),
                style: TextStyle(
                  fontSize: isPrice ? 13 : 9,
                  fontWeight: isPrice ? FontWeight.bold : FontWeight.w400,
                  color:
                      isPrice
                          ? AppColors.fieryRed
                          : AppColors.background.withOpacity(0.75),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
