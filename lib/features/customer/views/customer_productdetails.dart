import 'package:flutter/material.dart';
import 'package:veiled_frames/core/constants/app_colors.dart';
import 'package:veiled_frames/features/customer/views/customer_artistprofile.dart';
import 'package:veiled_frames/features/customer/views/customer_cart.dart';
import 'package:veiled_frames/features/customer/views/customer_checkout.dart';

class CustomerProductDetails extends StatefulWidget {
  const CustomerProductDetails({super.key});

  @override
  State<CustomerProductDetails> createState() => _CustomerProductDetailsState();
}

class _CustomerProductDetailsState extends State<CustomerProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        toolbarHeight: 75.0,
        backgroundColor: AppColors.appBarBackground,
        title: Row(children: <Widget>[
          ],
        ),
        iconTheme: IconThemeData(color: AppColors.fieryRed),
        actions: <Widget>[
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
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[_buildItemCard()],
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.appBarBackground,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Image.asset("assets/images/Artist_Button.png"),
              iconSize: 36.0,
              color: AppColors.fieryRed,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomerArtistprofile(),
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  side: const BorderSide(
                    color: AppColors.secondary,
                    width: 1.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35.0,
                    vertical: 20.0,
                  ),
                  minimumSize: const Size(0, 0),
                ),
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(
                    color: AppColors.whiteShade,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
            ),
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
                    horizontal: 50.0,
                    vertical: 20.0,
                  ),
                  minimumSize: const Size(0, 0),
                ),
                child: const Text(
                  "Buy Now",
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

  Widget _buildItemCard() {
    return ListView.builder(
      itemCount: 1,
      shrinkWrap: true,

      itemBuilder: (context, index) {
        return _selectedItemCard(
          _getImageItem(index),
          _getTitleItem(index),
          _getDescriptionItem(index),
          _getPriceItem(index),
        );
      },
    );
  }

  Widget _selectedItemCard(
    String image,
    String title,
    String description,
    double price,
  ) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppColors.whiteShade,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(image, fit: BoxFit.fill, height: 400),
          ),
          SizedBox(height: 10.0),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                "₱${price.toStringAsFixed(2)}",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 30.0,
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w700,
                  height: 1.00,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Divider(color: AppColors.background, height: 0),
          SizedBox(height: 10.0),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16.0,
                  color: AppColors.background,
                  fontWeight: FontWeight.w600,
                  height: 1.00,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                description,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14.0,
                  color: AppColors.background.withOpacity(0.5),
                  fontWeight: FontWeight.w400,
                  height: 1.00,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getImageItem(int index) {
    List<String> imageItem = [
      'assets/images/products_images/product_test1.png',
      'assets/images/products_images/product_test1.png',
      'assets/images/products_images/product_test1.png',
      'assets/images/products_images/product_test1.png',
      'assets/images/products_images/product_test1.png',
    ];
    return imageItem[0];
  }

  String _getTitleItem(int index) {
    List<String> titleItem = [
      'Impasto Oil Portrait of Princess Diana',
      'Impasto Oil Portrait of Princess Diana',
      'Impasto Oil Portrait of Princess Diana',
      'Impasto Oil Portrait of Princess Diana',
      'Impasto Oil Portrait of Princess Diana',
    ];

    String text = titleItem[0];
    if (text.length > 100) {
      return '${text.substring(0, 100)}...';
    }
    return text;
  }

  String _getDescriptionItem(int index) {
    List<String> descriptionItem = [
      'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?',
    ];
    return descriptionItem[0];
  }

  double _getPriceItem(int index) {
    List<double> priceItem = [100.00, 200.00, 300.00, 400.00, 500.00];
    return priceItem[0];
  }
}
