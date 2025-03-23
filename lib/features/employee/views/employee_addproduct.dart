import 'package:flutter/material.dart';
import 'package:veiled_frames/core/constants/app_colors.dart';
import 'package:veiled_frames/features/widgets/global_appbar.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final List<String> statusOptions = ["ACTIVE", "INACTIVE", "SOLD"];
  late String selectedStatus;

  @override
  void initState() {
    super.initState();
    selectedStatus = statusOptions.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppbar(),
      body: formBody(),
      backgroundColor: AppColors.background,
    );
  }

  final TextEditingController _prodName = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _stocks = TextEditingController();
  final TextEditingController _productsSold = TextEditingController();
  final TextEditingController _stocksLeft = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _dimension = TextEditingController();
  final TextEditingController _medium = TextEditingController();
  final TextEditingController _images = TextEditingController();

  void handleAddProduct() async {
    //TODO: add product functionality
  }

  Widget formBody() {
    return (SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          children: [
            inputField(
              _prodName,
              "Product Name:",
              "Product Name",
              TextInputType.text,
            ),
            inputField(_price, "Price:", "₱ 0.00 ", TextInputType.text),
            inputField(_stocks, "Stocks:", "0", TextInputType.emailAddress),
            inputField(
              _productsSold,
              "Products Sold:",
              "0",
              TextInputType.number,
            ),
            inputField(_stocksLeft, "Stocks left:", "0", TextInputType.text),
            SizedBox(height: 1),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Product Status",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedStatus,
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
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
            SizedBox(height: 10),
            inputField(
              _description,
              "Product Description:",
              "Type here...",
              TextInputType.text,
            ),
            inputField(
              _dimension,
              "Product Dimension:",
              "Product Dimension",
              TextInputType.number,
            ),
            inputField(
              _medium,
              "Product Medium:",
              "Product Medium",
              TextInputType.text,
            ),
            inputField(
              _images,
              "Product Image:",
              "insert url",
              TextInputType.number,
            ),

            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  // todo: add product
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.fieryRed,
                  side: const BorderSide(color: AppColors.fieryRed, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 20.0,
                  ),
                  minimumSize: const Size(0, 0),
                ),
                child: const Text(
                  "Submit",
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
    ));
  }

  Widget inputField(
    TextEditingController controller,
    String title,
    String label,
    TextInputType type,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align label to the left
      children: [
        Text(
          title, // Static label above the TextField
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.white,
          ),
        ),
        // Add spacing between label and TextField
        TextField(
          controller: controller,

          decoration: InputDecoration(
            hintText: label,
            hintStyle: TextStyle(
              color: AppColors.fieryRed.withOpacity(0.75),
              fontStyle: FontStyle.italic,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: AppColors.whiteShade,
          ),

          keyboardType: type,
        ),
        SizedBox(height: 17),
      ],
    );
  }
}
