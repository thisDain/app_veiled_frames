import 'package:flutter/material.dart';
import 'package:veiled_frames/features/customer/views/customer_cart.dart';

class CustomerProductDetails extends StatefulWidget {
  const CustomerProductDetails({super.key});

  @override
  State<CustomerProductDetails> createState() => _CustomerProductDetailsState();
}

class _CustomerProductDetailsState extends State<CustomerProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D142C),
      appBar: AppBar(
        toolbarHeight: 75.0,
        backgroundColor: Color(0xFF510A32),
        title: Row(children: <Widget>[Text("data")]),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Color(0xFFEE4540),
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
}
