import 'package:flutter/material.dart';
import 'package:veiled_frames/core/constants/app_colors.dart';
import 'package:veiled_frames/core/constants/products.dart';
import 'package:veiled_frames/features/customer/views/customer_checkout.dart';

class CustomerCart extends StatefulWidget {
  const CustomerCart({super.key});

  @override
  State<CustomerCart> createState() => _CustomerCartState();
}

class _CustomerCartState extends State<CustomerCart> {
  List<Map<String, dynamic>> products = [
    {
      'artistName': 'Viktoria Smith',
      'artistEmail': 'victoriasmith@gmail.com',
      'artistProfile': 'assets/profile1.png',
      'name': 'Original Painting - Under Verdant Shadows',
      'quantity': 1,
      'price': 10000.00,
    },
    {
      'artistName': 'Viktoria Smith',
      'artistEmail': 'victoriasmith@gmail.com',
      'artistProfile': 'assets/profile1.png',
      'name': 'Study of Sleep and Color 11.8" × 15.7" Oil Paint',
      'quantity': 1,
      'price': 12785.00,
    },
    {
      'artistName': 'John Doe',
      'artistEmail': 'victoriasmith@gmail.com',
      'artistProfile': 'assets/profile2.png',
      'name': 'Abstract Art - Crimson Echoes',
      'quantity': 2,
      'price': 1500.00,
    },
  ];

  late List<bool> isCheckedList;
  bool isAllSelected = false;

  @override
  void initState() {
    super.initState();
    isCheckedList = List<bool>.filled(products.length, false);
  }

  Map<String, List<Map<String, dynamic>>> groupByArtist() {
    Map<String, List<Map<String, dynamic>>> grouped = {};
    for (var product in products) {
      String artist = product['artistName'];
      if (!grouped.containsKey(artist)) {
        grouped[artist] = [];
      }
      grouped[artist]!.add(product);
    }
    return grouped;
  }

  @override
  Widget build(BuildContext context) {
    var groupedProducts = groupByArtist();

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: groupedProducts.entries.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16.0),
          itemBuilder: (context, index) {
            var entry = groupedProducts.entries.elementAt(index);
            return Container(
              decoration: BoxDecoration(
                color: AppColors.whiteShade,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildArtistHeader(
                    entry.key,
                    entry.value.first['artistProfile'],
                    entry.value.first['artistEmail'],
                  ),
                  ...entry.value
                      .map((product) => _buildCartItemCard(product))
                      .toList(),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }

  Widget _buildArtistHeader(
    String artistName,
    String profileImage,
    String email,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: AppColors.fieryRed,
            child: Icon(
              Icons.person_outline,
              color: AppColors.whiteShade,
              size: 10,
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                artistName,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.background,
                ),
              ),
              Text(
                email,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w300,
                  color: AppColors.fieryRed,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCartItemCard(Map<String, dynamic> product) {
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
          children: <Widget>[
            Checkbox(
              activeColor: AppColors.fieryRed,
              value: isCheckedList[products.indexOf(product)],
              onChanged: (bool? value) {
                setState(() {
                  isCheckedList[products.indexOf(product)] = value!;
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
                  Text(
                    product['name'],
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.background,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Quantity: x${product['quantity']}",
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
                        "$pesoSign ${product['price'].toString()}",
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

  Widget _buildBottomAppBar() {
    int selectedQuantity = isCheckedList.where((checked) => checked).length;
    double totalPrice = 0.0;
    for (int i = 0; i < isCheckedList.length; i++) {
      if (isCheckedList[i]) {
        totalPrice += products[i]['price'] * products[i]['quantity'];
      }
    }

    return BottomAppBar(
      color: AppColors.appBarBackground,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  activeColor: AppColors.fieryRed,
                  value: isAllSelected,
                  onChanged: (bool? value) {
                    setState(() {
                      isAllSelected = value!;
                      isCheckedList = List<bool>.filled(products.length, value);
                    });
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                const Text(
                  "All",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Quantity  $selectedQuantity",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Total $pesoSign ${totalPrice.toStringAsFixed(0)}",
                  style: const TextStyle(
                    color: Colors.redAccent,
                    fontSize: 11.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed:
                  selectedQuantity > 0
                      ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CustomerCheckout(),
                          ),
                        );
                      }
                      : null,
              style: TextButton.styleFrom(
                backgroundColor:
                    selectedQuantity > 0 ? AppColors.fieryRed : Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
              ),
              child: const Text(
                "Check out",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
