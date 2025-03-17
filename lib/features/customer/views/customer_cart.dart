import 'package:flutter/material.dart';

class CustomerCart extends StatefulWidget {
  const CustomerCart({super.key});

  @override
  State<CustomerCart> createState() => _CustomerCartState();
}

class _CustomerCartState extends State<CustomerCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D142C),
      appBar: AppBar(
        toolbarHeight: 75.0,
        backgroundColor: Color(0xFF510A32),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "My Cart",
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
    );
  }
}
