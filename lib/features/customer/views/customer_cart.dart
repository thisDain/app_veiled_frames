import 'package:flutter/material.dart';
import 'package:veiled_frames/core/constants/app_colors.dart';
import 'package:veiled_frames/features/customer/views/customer_checkout.dart';

class CustomerCart extends StatefulWidget {
  const CustomerCart({super.key});

  @override
  State<CustomerCart> createState() => _CustomerCartState();
}

class _CustomerCartState extends State<CustomerCart> {
  List<Map<String, dynamic>> products = [
    {
      'name': 'Original Painting - Under Verdant Shadows',
      'quantity': 1,
      'price': 1000.00,
    },
    {'name': 'Abstract Art - Crimson Echoes', 'quantity': 2, 'price': 1500.00},
  ];

  // Track checkbox selection per item
  late List<bool> isCheckedList;

  @override
  void initState() {
    super.initState();
    isCheckedList = List<bool>.filled(products.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D142C),
      appBar: AppBar(
        toolbarHeight: 75.0,
        backgroundColor: Color(0xFF510A32),
        iconTheme: IconThemeData(color: AppColors.fieryRed),
        title: const Text(
          "My Cart",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: Color(0xFFFAFAF0),
          ),
        ),
        centerTitle: true,
      ),
      body: _buildItemRow(),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.appBarBackground,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CustomerCheckout()),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.fieryRed,
                  side: const BorderSide(color: AppColors.fieryRed, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 20.0,
                  ),
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

  Widget _buildItemRow() {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            const SizedBox(height: 15),
            _buildCartItemCard(
              index,
              products[index]['name'],
              products[index]['quantity'],
              products[index]['price'],
            ),
          ],
        );
      },
    );
  }

  Widget _buildCartItemCard(
    int index,
    String name,
    int quantity,
    double price,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 150.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.whiteShade,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Checkbox(
              activeColor: AppColors.fieryRed,
              value: isCheckedList[index],
              onChanged: (bool? value) {
                setState(() {
                  isCheckedList[index] = value!;
                });
              },
            ),
            const SizedBox(width: 10),
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: AppColors.dustyBlush,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.image, color: AppColors.crimsonWine, size: 20),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: double.infinity, // Takes available space
                    child: Text(
                      name,
                      maxLines: 2, // Allows wrapping to 2 lines
                      softWrap: true, // Enables wrapping
                      overflow: TextOverflow.ellipsis, // If text is too long
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.background,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Quantity: x$quantity",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.background.withOpacity(.5),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "₱ ${price.toString()}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.fieryRed,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete_outline_rounded,
                          color: AppColors.fieryRed,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
