import 'package:flutter/material.dart';
import 'package:veiled_frames/core/constants/app_colors.dart';

class CustomerCheckout extends StatefulWidget {
  const CustomerCheckout({super.key});

  @override
  State<CustomerCheckout> createState() => _CustomerCheckoutState();
}

class _CustomerCheckoutState extends State<CustomerCheckout> {
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
}
