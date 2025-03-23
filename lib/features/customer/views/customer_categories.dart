import 'package:flutter/material.dart';
import 'package:veiled_frames/core/constants/app_colors.dart';

class CustomerCategoriesSection extends StatefulWidget {
  const CustomerCategoriesSection({super.key});

  @override
  State<CustomerCategoriesSection> createState() =>
      _CustomerCategoriesSectionState();
}

class _CustomerCategoriesSectionState extends State<CustomerCategoriesSection> {
  final List<String> statusOptions = [
    "Oil Paint",
    "Watercolor",
    "Acrylic Paint",
    "Pastels",
    "Gouache",
    "Ink",
    "Graphite",
    "Charcoal",
    "Mixed Media",
  ];
  late String selectedStatus;

  @override
  void initState() {
    super.initState();
    selectedStatus = statusOptions.first;
  }

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
              "Categories",
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
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  color: AppColors.background,
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.whiteShade,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Color(0xFFEE4540),
                              ),
                              border: InputBorder.none,
                              hintText: 'Search an item',
                              hintStyle: TextStyle(
                                color: Color(0xFFBDBDBD),
                                fontSize: 16.0,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 12.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Container(
                        width: 150,
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.fieryRed,
                            width: 1.5,
                          ),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedStatus,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: AppColors.fieryRed,
                            ),
                            dropdownColor: AppColors.secondary,
                            style: const TextStyle(color: Colors.white),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() => selectedStatus = newValue);
                              }
                            },
                            items:
                                statusOptions.map((String status) {
                                  return DropdownMenuItem<String>(
                                    value: status,
                                    child: Text(
                                      status,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  );
                                }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _buildArtistProducts(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildArtistProducts() {
    return Container(
      decoration: BoxDecoration(color: AppColors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: _buildProducts(),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Widget _buildProducts() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 15.0,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Container(
          color: AppColors.white,
          child: GridTile(
            child: _buildNewWorksCard(
              products[index]['image'],
              products[index]['text'],
              products[index]['price'],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNewWorksCard(String imagePath, String text, double price) {
    String constrainedText = text;
    if (text.length > 30) {
      constrainedText = '${text.substring(0, 30)}...';
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteShade,
          borderRadius: BorderRadius.circular(2.0),
          border: Border.all(
            color: AppColors.secondary.withOpacity(0.75),
            width: 1.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 4.0),
            Image.asset(imagePath, height: 90.0, width: 100.0),
            SizedBox(height: 2.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      constrainedText,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 8.0,
                        color: AppColors.background,
                        fontWeight: FontWeight.w400,
                        height: 1.00,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      "₱${price.toStringAsFixed(2)}",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 11.0,
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Divider(color: AppColors.background, height: 0),
                    SizedBox(height: 4.0),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFFFAFAF0),
                          side: const BorderSide(
                            color: Color(0xFFEE4540),
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 4.0,
                          ),
                          minimumSize: const Size(0, 0),
                        ),
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(
                            color: AppColors.fieryRed,
                            fontSize: 10.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> products = [
    {
      'image': 'assets/images/products_images/product_test1.png',
      'text':
          'Impasto Oil Portrait 1 Impasto Oil Portrait 1 Impasto Oil Portrait 1 Impasto Oil Portrait 1',
      'price': 100.00,
    },
    {
      'image': 'assets/images/products_images/product_test2.png',
      'text': 'Impasto Oil Portrait 2ImpastoImpastoImpastoImpastoImpasto',
      'price': 200.00,
    },
    {
      'image': 'assets/images/products_images/product_test2.png',
      'text': 'Impasto Oil Portrait 2',
      'price': 200.00,
    },
    {
      'image': 'assets/images/products_images/product_test1.png',
      'text': 'Impasto Oil Portrait 1',
      'price': 100.00,
    },
    {
      'image': 'assets/images/products_images/product_test2.png',
      'text': 'Impasto Oil Portrait 2',
      'price': 200.00,
    },
    {
      'image': 'assets/images/products_images/product_test2.png',
      'text': 'Impasto Oil Portrait 2',
      'price': 200.00,
    },
    {
      'image': 'assets/images/products_images/product_test1.png',
      'text':
          'Impasto Oil Portrait 1 Impasto Oil Portrait 1 Impasto Oil Portrait 1 Impasto Oil Portrait 1',
      'price': 100.00,
    },
    {
      'image': 'assets/images/products_images/product_test2.png',
      'text': 'Impasto Oil Portrait 2ImpastoImpastoImpastoImpastoImpasto',
      'price': 200.00,
    },
    {
      'image': 'assets/images/products_images/product_test2.png',
      'text': 'Impasto Oil Portrait 2',
      'price': 200.00,
    },
    {
      'image': 'assets/images/products_images/product_test1.png',
      'text': 'Impasto Oil Portrait 1',
      'price': 100.00,
    },
    {
      'image': 'assets/images/products_images/product_test2.png',
      'text': 'Impasto Oil Portrait 2',
      'price': 200.00,
    },
    {
      'image': 'assets/images/products_images/product_test2.png',
      'text': 'Impasto Oil Portrait 2',
      'price': 200.00,
    },
  ];
}
