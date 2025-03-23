import 'package:flutter/material.dart';
import 'package:veiled_frames/core/constants/app_colors.dart';
import 'package:veiled_frames/features/widgets/global_appbar.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final List<String> statusOptions = [
    "PROCESSING",
    "ACTIVE",
    "SHIPPED",
    "DELIVERED",
    "CANCELLED",
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
      appBar: GlobalAppbar(),
      body: formBody(),
      backgroundColor: AppColors.background,
    );
  }

  void handleEditProduct() async {
    //TODO: edit product functionality
  }

  List<Map<String, dynamic>> order = [
    {
      'orderNo': '001',
      'date': '03-04-2025',
      'name': 'The Sunflower',
      'productNo': '1',
      'medium': 'Watercolor',
      'dimension': '8..5" x 13"',
      'quantity': '2',
      'price': '3,000.00',
    },
  ];

  List<Map<String, dynamic>> ship = [
    {
      'name': 'Juan Dela Cruz',
      'address': 'Santo Rosario, Angeles City, Pampanga, Philippines, 2009',
      'phone': '0912 345 6789',
      'deliverMethod': 'Standard Delivery',
    },
  ];

  List<Map<String, dynamic>> pay = [
    {
      'payMode': 'GCash',
      'origPrice': '1,500.00',
      'quantity': '2',
      'subtotal': '3,000.00',
      'deliverCharge': '100.00',
      'total': '3,100.00',
    },
  ];

  Widget formBody() {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Orders Details',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ),
              Divider(color: AppColors.crimsonWine),
              _orderDetails(
                order[0]['orderNo'],
                order[0]['date'],
                order[0]['name'],
                order[0]['productNo'],
                order[0]['medium'],
                order[0]['dimension'],
                order[0]['quantity'],
                order[0]['price'],
              ),
              Divider(color: AppColors.crimsonWine, thickness: 5),
              _shippingDetails(
                ship[0]['name'],
                ship[0]['address'],
                ship[0]['phone'],
                ship[0]['deliverMethod'],
              ),
              Divider(color: AppColors.crimsonWine, thickness: 5),
              _paymentDetails(
                pay[0]['payMode'],
                pay[0]['origPrice'],
                pay[0]['quantity'],
                pay[0]['subtotal'],
                pay[0]['deliverCharge'],
                pay[0]['total'],
              ),
              SizedBox(height: 50),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.white, width: 1.5),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedStatus,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
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
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    // todo: add product
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.fieryRed,
                    side: const BorderSide(
                      color: AppColors.fieryRed,
                      width: 1.5,
                    ),
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
                    "Update Order",
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
      ],
    );
  }

  Widget _orderDetails(
    String orderNo,
    String date,
    String name,
    String productNo,
    String medium,
    String dimension,
    String quantity,
    String price,
    //
  ) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              "Order Number:",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(width: 10),
            Text(
              orderNo.toString(),
              style: TextStyle(
                color: AppColors.fieryRed,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.calendar_today_outlined,
              color: AppColors.secondary,
              size: 15,
            ),
            SizedBox(width: 10),
            Text(
              "Date Ordered:",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: AppColors.white.withOpacity(0.5),
              ),
            ),
            SizedBox(width: 10),
            Text(
              date,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.white.withOpacity(0.70),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 140,
                  width: 100,
                  decoration: BoxDecoration(
                    color: AppColors.rosewoodMauve,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(Icons.image, size: 50),
                ),
              ],
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  "\t\t\t\t\tProduct No. $productNo",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white.withOpacity(.5),
                  ),
                ),
                Text(
                  "\t\t\t\t\tMedium: $medium",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white.withOpacity(.5),
                  ),
                ),
                Text(
                  "\t\t\t\t\tDimension: $dimension",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white.withOpacity(.5),
                  ),
                ),
                Text(
                  "\t\t\t\t\tQty: $quantity",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white.withOpacity(.5),
                  ),
                ),
                Text(
                  "\t\t\t₱ $price",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _shippingDetails(
    String name,
    String address,
    String phone,
    String deliverMethod,
  ) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Shipping Details",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
              ),
            ),
            Spacer(),
            Icon(Icons.place_outlined, color: AppColors.fieryRed, size: 25),
          ],
        ),
        Divider(color: AppColors.crimsonWine),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: AppColors.white,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  address,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w200,
                    color: AppColors.white.withOpacity(.8),
                    height: 1,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(
                      Icons.phone_outlined,
                      color: AppColors.fieryRed,
                      size: 25,
                    ),
                    SizedBox(width: 10),
                    Text(
                      phone,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(
                      Icons.local_shipping_outlined,
                      color: AppColors.fieryRed,
                      size: 25,
                    ),
                    SizedBox(width: 10),
                    Text(
                      deliverMethod,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _paymentDetails(
    String paymode,
    String origPrice,
    String quantity,
    String subtotal,
    String deliverCharge,
    String total,
  ) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Payment Details",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
              ),
            ),
            Spacer(),
            Icon(Icons.credit_card, color: AppColors.fieryRed, size: 25),
          ],
        ),
        Divider(color: AppColors.crimsonWine),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(
                      Icons.credit_score_outlined,
                      color: AppColors.fieryRed,
                      size: 25,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Mode of Payment: $paymode",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Original Price:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white.withOpacity(.5),
                    ),
                  ),
                  Spacer(),
                  Text(
                    "₱ $origPrice",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white.withOpacity(.5),
                      height: 1,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Quantity Ordered:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white.withOpacity(.5),
                    ),
                  ),
                  Spacer(),
                  Text(
                    "x $quantity",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white.withOpacity(.5),
                      height: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Price:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white.withOpacity(.5),
                    ),
                  ),
                  Spacer(),
                  Text(
                    "₱ $subtotal",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white.withOpacity(.5),
                      height: 1,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delivery Charge:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white.withOpacity(.5),
                    ),
                  ),
                  Spacer(),
                  Text(
                    "+ ₱ $deliverCharge",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white.withOpacity(.5),
                      height: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Payable:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: AppColors.white,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "₱ $total",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                      height: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
