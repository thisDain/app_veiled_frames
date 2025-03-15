import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();

  void _scroll(double amount) {
    _scrollController.animateTo(
      _scrollController.offset + amount,
      duration: Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D142C),
      appBar: AppBar(
        toolbarHeight: 75.0,
        backgroundColor: Color(0xFF510A32),
        title: Row(
          children: <Widget>[
            Image.asset('assets/images/logo_main.png', height: 45.0),
            SizedBox(width: 10),
            Text(
              'VEILED\nFRAMES',
              style: TextStyle(
                fontFamily: 'Lisu Bosa',
                color: Color(0xFFFFFFE4),
                fontSize: 25.0,
                height: 0.90,
                fontWeight: FontWeight.w200,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu, color: Color(0xFFFFFFE4), size: 40.0),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildSearchBarRow(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Categories',
                style: TextStyle(
                  color: Color(0xFFFFFFE4),
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Color(0xFFEE4540)),
                  onPressed: () => _scroll(-100.0),
                ),
                SizedBox(
                  height: 78.0,
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: _buildCategoryRow(),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios, color: Color(0xFFEE4540)),
                  onPressed: () => _scroll(100.0),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Recommended',
                style: TextStyle(
                  color: Color(0xFFFFFFE4),
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'New Works',
                style: TextStyle(
                  color: Color(0xFFFFFFE4),
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Color(0xFFEE4540)),
                  onPressed: () => _scroll(-100.0),
                ),
                SizedBox(
                  height: 78.0,
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: _buildCategoryRow(),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios, color: Color(0xFFEE4540)),
                  onPressed: () => _scroll(100.0),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Top Artists',
                style: TextStyle(
                  color: Color(0xFFFFFFE4),
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Color(0xFFEE4540)),
                  onPressed: () => _scroll(-100.0),
                ),
                SizedBox(
                  height: 78.0,
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: _buildCategoryRow(),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios, color: Color(0xFFEE4540)),
                  onPressed: () => _scroll(100.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBarRow() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
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
              Icons.favorite_border,
              color: Color(0xFFEE4540),
              size: 30.0,
            ),
            onPressed: () {},
          ),
          SizedBox(width: 5.0),
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Color(0xFFEE4540),
              size: 30.0,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryRow() {
    return ListView.builder(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      itemCount: 9,
      itemBuilder: (context, index) {
        return _buildCategoryCard(
          _getImagePath(index),
          _getCategoryText(index),
        );
      },
    );
  }

  String _getImagePath(int index) {
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

  Widget _buildCategoryCard(String imagePath, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 78.0,
        width: 62.0,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFE4),
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
                color: Color(0xFFC72C41),
                fontWeight: FontWeight.w600,
                height: 0.90,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
