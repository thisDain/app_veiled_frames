import 'package:flutter/material.dart';
import 'package:veiled_frames/core/constants/app_colors.dart';
import 'package:veiled_frames/core/constants/products.dart';
import 'package:veiled_frames/features/customer/views/customer_artistprofile.dart';
import 'package:veiled_frames/features/customer/views/customer_cart.dart';
import 'package:veiled_frames/features/customer/views/customer_categories.dart';
import 'package:veiled_frames/features/customer/views/customer_productdetails.dart';
import 'package:veiled_frames/features/widgets/global_appbar.dart';

class CustomerDashboard extends StatefulWidget {
  const CustomerDashboard({super.key});

  @override
  State<CustomerDashboard> createState() => _CustomerDashboardState();
}

class _CustomerDashboardState extends State<CustomerDashboard> {
  final ScrollController _scrollController1 = ScrollController();
  final ScrollController _scrollController2 = ScrollController();
  final ScrollController _scrollController3 = ScrollController();

  void _scroll1(double amount) {
    _scrollController1.animateTo(
      _scrollController1.position.pixels + amount,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  void _scroll2(double amount) {
    _scrollController2.animateTo(
      _scrollController2.position.pixels + amount,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  void _scroll3(double amount) {
    _scrollController3.animateTo(
      _scrollController3.position.pixels + amount,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: GlobalAppbar(),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          //"SEARCH BAR" Section
          _buildSearchBarRow(),

          //"CATEGORIES" Section
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Categories',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Container(
            height: 78.0,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.fieryRed,
                  ),
                  onPressed: () => _scroll1(-100.0),
                ),
                Expanded(
                  child: ClipRect(
                    child: SizedBox(
                      height: double.infinity,
                      child: _buildCategoryRow(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.fieryRed,
                  ),
                  onPressed: () => _scroll1(100.0),
                ),
              ],
            ),
          ),

          //"RECOMMENDED" Section
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Recommended',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Container(
            height: 148.0,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: _buildRecommendedRow(),
          ),

          //"NEW WORKS" Section
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'New Works',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Container(
            height: 160.0,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.fieryRed,
                  ),
                  onPressed: () => _scroll2(-100.0),
                ),
                Expanded(
                  child: ClipRect(
                    child: SizedBox(
                      height: double.infinity,
                      child: _buildNewWorksRow(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.fieryRed,
                  ),
                  onPressed: () => _scroll2(100.0),
                ),
              ],
            ),
          ),

          //"TOP ARTISTS" Section
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Top Artists',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Container(
            height: 150.0,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.fieryRed,
                  ),
                  onPressed: () => _scroll3(-100.0),
                ),
                Expanded(
                  child: ClipRect(
                    child: SizedBox(
                      height: double.infinity,
                      child: _buildTopArtistsRow(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.fieryRed,
                  ),
                  onPressed: () => _scroll3(100.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //"Seach Bar, Favorites, Cart" Row
  Widget _buildSearchBarRow() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.whiteShade,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Color(0xFFEE4540)),
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
          SizedBox(width: 16.0),
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.fieryRed,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomerCart()),
              );
            },
          ),
        ],
      ),
    );
  }

  //"Categories" Row
  Widget _buildCategoryRow() {
    return ListView.builder(
      controller: _scrollController1,
      scrollDirection: Axis.horizontal,
      itemCount: 9,
      itemBuilder: (context, index) {
        return _buildCategoryCard(
          _getCategoryImagePath(index),
          _getCategoryText(index),
        );
      },
    );
  }

  Widget _buildCategoryCard(String imagePath, String text) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CustomerCategoriesSection()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          height: 78.0,
          width: 62.0,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(2.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(imagePath, height: 41.0),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 10.0,
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w600,
                  height: 0.90,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getCategoryImagePath(int index) {
    List<String> imagePaths = [
      'assets/images/categories_images/oilpaint.png',
      'assets/images/categories_images/watercolor_mixedmedia.png',
      'assets/images/categories_images/acrylicpaint.png',
      'assets/images/categories_images/pastels_graphite_charcoal.png',
      'assets/images/categories_images/gouache_ink.png',
      'assets/images/categories_images/gouache_ink.png',
      'assets/images/categories_images/pastels_graphite_charcoal.png',
      'assets/images/categories_images/pastels_graphite_charcoal.png',
      'assets/images/categories_images/watercolor_mixedmedia.png',
    ];
    return imagePaths[index];
  }

  String _getCategoryText(int index) {
    List<String> categoryTexts = [
      'Oil Paint',
      'Water\ncolor',
      'Acrylic Paint',
      'Pastels',
      'Gouache',
      'Ink',
      'Graphite',
      'Charcoal',
      'Mixed Media',
    ];
    return categoryTexts[index];
  }

  //"Recommended" Row
  Widget _buildRecommendedRow() {
    return Center(
      child: SizedBox(
        height: 148.0,
        width: 354.0,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFE54A12), Color(0xFF651B00)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(2.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 15.0),
              Image.asset(
                "assets/images/recommended/recommended.png",
                height: 100.0,
              ),
              SizedBox(width: 15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0),
                  Text(
                    "Fresh from \nthe studio!",
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 32.0,
                      color: AppColors.whiteShade,
                      fontWeight: FontWeight.w800,
                      height: 0.90,
                    ),
                  ),
                  Text(
                    "@artistname's latest mixed media piece. \nDon't miss it!",
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 10.0,
                      color: AppColors.whiteShade,
                      fontWeight: FontWeight.w300,
                      height: 1.50,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomerArtistprofile(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF2672E8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 1.0,
                      ),
                      side: const BorderSide(
                        color: AppColors.background,
                        width: 1.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    child: const Text(
                      "VISIT PROFILE",
                      style: TextStyle(
                        color: AppColors.whiteShade,
                        fontSize: 10.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        height: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //"New Works" Row
  Widget _buildNewWorksRow() {
    return ListView.builder(
      controller: _scrollController2,
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return _buildNewWorksCard(
          _getNewWorksImagePath(index),
          _getNewWorksText(index),
          _getNewWorksPrice(index),
        );
      },
    );
  }

  Widget _buildNewWorksCard(String imagePath, String text, double price) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 160.0,
        width: 110.0,
        decoration: BoxDecoration(
          color: AppColors.whiteShade,
          borderRadius: BorderRadius.circular(2.0),
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
                      text,
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
                      "$pesoSign ${price.toStringAsFixed(2)}",
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CustomerProductDetails(),
                            ),
                          );
                        },
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
                          "View Item",
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

  String _getNewWorksImagePath(int index) {
    List<String> imagePaths = [
      'assets/images/products_images/product_test1.png',
      'assets/images/products_images/product_test2.png',
      'assets/images/products_images/product_test3.png',
      'assets/images/products_images/product_test4.png',
      'assets/images/products_images/product_test5.png',
    ];
    return imagePaths[index];
  }

  String _getNewWorksText(int index) {
    List<String> newWorksTexts = [
      'Impasto Oil Portrait of Princess Diana',
      'Impasto Oil Portrait of Princess Diana',
      'Impasto Oil Portrait of Princess Diana',
      'Impasto Oil Portrait of Princess Diana',
      'Impasto Oil Portrait of Princess Diana',
    ];

    String text = newWorksTexts[index];
    if (text.length > 30) {
      return '${text.substring(0, 30)}...';
    }
    return newWorksTexts[index];
  }

  double _getNewWorksPrice(int index) {
    List<double> newWorksPrice = [100.00, 200.00, 300.00, 400.00, 500.00];
    return newWorksPrice[index];
  }

  //"Top Artists" Row

  Widget _buildTopArtistsRow() {
    return ListView.builder(
      controller: _scrollController3,
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return _buildTopArtistCard(
          _getTopArtistImagePath(index),
          _getTopArtistText(index),
        );
      },
    );
  }

  Widget _buildTopArtistCard(String imagePath, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 160.0,
        width: 110.0,
        decoration: BoxDecoration(
          color: AppColors.whiteShade,
          borderRadius: BorderRadius.circular(2.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 4.0),
            ClipOval(
              child: Image.asset(
                imagePath,
                height: 80.0,
                width: 80.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 12.0,
                          color: AppColors.background,
                          fontWeight: FontWeight.w600,
                          height: 1.00,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Divider(color: AppColors.background, height: 0),
                    SizedBox(height: 4.0),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CustomerArtistprofile(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.whiteShade,
                          side: const BorderSide(
                            color: AppColors.fieryRed,
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
                          "View Profile",
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

  String _getTopArtistImagePath(int index) {
    List<String> imagePaths = [
      'assets/images/products_images/product_test1.png',
      'assets/images/products_images/product_test2.png',
      'assets/images/products_images/product_test3.png',
      'assets/images/products_images/product_test4.png',
      'assets/images/products_images/product_test5.png',
    ];
    return imagePaths[index];
  }

  String _getTopArtistText(int index) {
    List<String> topArtistTexts = [
      'Victoria Smith',
      'Michael Kaiser',
      'Kaelix Debonair',
      'Guji Yae',
      'Sylus Kael',
    ];

    return topArtistTexts[index];
  }
}
