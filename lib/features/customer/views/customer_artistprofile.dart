import 'package:flutter/material.dart';
import 'package:veiled_frames/core/constants/app_colors.dart';

class CustomerArtistprofile extends StatefulWidget {
  const CustomerArtistprofile({super.key});

  @override
  State<CustomerArtistprofile> createState() => _CustomerArtistprofileState();
}

class _CustomerArtistprofileState extends State<CustomerArtistprofile> {
  final double coverHeight = 200;
  final double profileHeight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D142C),
      appBar: AppBar(
        toolbarHeight: 75.0,
        backgroundColor: Color(0xFF510A32),
        iconTheme: IconThemeData(color: AppColors.fieryRed),
        title: Align(
          alignment: Alignment.center,
          child: Text(
            "Veiled Frames Artist",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          Column(
            children: <Widget>[
              _buildArtistProfile(),
              SizedBox(height: 65),
              _getArtistDetails(),
            ],
          ),
          _buildArtistProducts(),
        ],
      ),
    );
  }

  //Artist Profile
  Widget _buildArtistProfile() {
    final top = coverHeight - profileHeight;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        _buildCoverImage(),
        Positioned(top: top, child: _buildArtistImage()),
      ],
    );
  }

  Widget _buildCoverImage() {
    return Container(
      color: AppColors.background,
      child: Image.asset(
        "assets/images/products_images/product_test1.png",
        width: double.infinity,
        height: coverHeight,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildArtistImage() {
    return CircleAvatar(
      backgroundColor: AppColors.fieryRed,
      radius: profileHeight,
      child: Icon(Icons.person, color: AppColors.white, size: 60),
    );
  }

  Widget _buildArtistDetails(
    String artistName,
    String artistEmail,
    String artistBio,
    String artistPhone,
    String artistPortfolio,
  ) {
    return Container(
      decoration: BoxDecoration(color: AppColors.background),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            artistName,
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
          Text(
            artistEmail,
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.fieryRed,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              artistBio,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
                height: 1.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.phone_outlined,
                  color: AppColors.fieryRed.withOpacity(0.5),
                  size: 18,
                ),
                SizedBox(width: 5.0),
                Text(
                  artistPhone,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontFamily: "Poppins",
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: AppColors.white.withOpacity(0.5),
                  ),
                ),
                SizedBox(width: 225.0),
                Icon(
                  Icons.public,
                  color: AppColors.fieryRed.withOpacity(0.5),
                  size: 18,
                ),
                SizedBox(width: 5.0),
                Text(
                  artistPortfolio,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontFamily: "Poppins",
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: AppColors.white.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getArtistDetails() {
    return _buildArtistDetails(
      "artistName",
      "@artistEmail",
      "artistBio",
      "artistPhone",
      "artistPortfolio",
    );
  }

  //Artist Artworks

  Widget _buildArtistProducts() {
    return Container(
      decoration: BoxDecoration(color: AppColors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 4.0,
              bottom: 0.0,
              right: 25.0,
              left: 25.0,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Products',
                style: TextStyle(
                  color: AppColors.fieryRed,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
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
  ];
}
