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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Veiled Frames Artist",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            _build(),
            SizedBox(height: 65),
            _getArtistDetails(),
          ],
        ),
      ),
    );
  }

  Widget _build() {
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
              ),
            ),
          ),
          Row(
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
              SizedBox(width: 200.0),
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
}
