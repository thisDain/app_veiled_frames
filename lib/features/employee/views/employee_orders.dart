import 'package:flutter/material.dart';
import 'package:veiled_frames/core/constants/app_colors.dart';
import 'package:veiled_frames/core/constants/orders.dart';
import 'package:veiled_frames/features/widgets/icon_text.dart';

class ArtistOrders extends StatefulWidget {
  const ArtistOrders({super.key});

  @override
  State<ArtistOrders> createState() => _ArtistOrdersState();
}

class _ArtistOrdersState extends State<ArtistOrders> {
  final List<String> statusOptions = [
    "Processing",
    "Active",
    "Shipped",
    "Delivered",
    "Cancelled",
  ];
  final ScrollController _scrollController =
      ScrollController(); // Create controller
  late String selectedStatus;

  @override
  void initState() {
    super.initState();
    selectedStatus = statusOptions.first; // Set default status
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Orders',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFEE4540),
                  ),
                ),
                Container(
                  width: 126,
                  height: 38,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: AppColors.secondary, // Background color
                    borderRadius: BorderRadius.circular(
                      10,
                    ), // Rounded square shape
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedStatus,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                      dropdownColor:
                          AppColors.secondary, // Dropdown background color
                      style: const TextStyle(color: Colors.white), // Text color
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() => selectedStatus = newValue);
                        }
                      },
                      items:
                          statusOptions.map((String status) {
                            return DropdownMenuItem<String>(
                              value: status,
                              child: Text(status),
                            );
                          }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(child: _ordersList()),
          ],
        ),
      ),
    );
  }

  Widget _ordersList() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 12, // Width of the scrollbar background
                      decoration: BoxDecoration(
                        color:
                            AppColors.rosewoodMauve, // Track background color
                        borderRadius: BorderRadius.circular(
                          6,
                        ), // Adjust for rounded edges
                      ),
                    ),
                  ),
                ),
                Scrollbar(
                  thickness: 8, // Scrollbar thickness
                  radius: const Radius.circular(10), // Rounded corners
                  thumbVisibility: true, // Always visible
                  interactive: true, // Draggable
                  trackVisibility: true,
                  scrollbarOrientation: ScrollbarOrientation.right,
                  controller: _scrollController,
                  child: Theme(
                    data: ThemeData(
                      scrollbarTheme: ScrollbarThemeData(
                        thumbColor: WidgetStateProperty.all(
                          AppColors.dustyBlush,
                        ), // Change color here
                        trackColor: WidgetStateProperty.all(
                          AppColors.dustyBlush,
                        ), // Track color
                        trackVisibility: WidgetStateProperty.all(true),
                      ),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      controller: _scrollController,
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        final order = orders[index];
                        return Container(
                          height: 120,
                          margin: EdgeInsets.only(bottom: 8, right: 30),
                          decoration: BoxDecoration(
                            color: Color(0xFF2D142C),
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(10),
                              left: Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Order No.: ${order['order_no']}",
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Spacer(),
                                    SizedBox(
                                      width: 70,
                                      height: 20,
                                      child: TextButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStateProperty.all(
                                                AppColors.secondary,
                                              ),
                                          shape: WidgetStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    3,
                                                  ), // Makes it a perfect square
                                            ),
                                          ),
                                          padding: WidgetStateProperty.all(
                                            EdgeInsets.symmetric(
                                              vertical: 3,
                                              horizontal: 2,
                                            ),
                                          ), // Optional: Ensures no extra padding
                                        ),
                                        child: Text(
                                          "View Details",
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(color: AppColors.crimsonWine),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start, // Align columns at the top
                                  children: [
                                    Expanded(
                                      // Ensures both columns start at the left
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start, // Align text to the left
                                        children: [
                                          IconText(
                                            icon: Icons.person,
                                            text: order['customer_name'],
                                            size: 16,
                                          ),
                                          IconText(
                                            icon: Icons.attach_money,
                                            text:
                                                "Payable: ${order['payable']}",
                                            size: 16,
                                          ),
                                          IconText(
                                            icon: Icons.calendar_month,
                                            text:
                                                "Order on: ${order['order_date']}",
                                            size: 16,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      // Ensures the right column also starts at the left
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start, // Align text to the left
                                        children: [
                                          IconText(
                                            icon: Icons.phone,
                                            text: order['contact'],
                                            size: 16,
                                          ),
                                          IconText(
                                            icon: Icons.location_pin,
                                            text: order['location'],
                                            size: 16,
                                          ),
                                          IconText(
                                            icon: Icons.delivery_dining,
                                            text: order['delivery_type'],
                                            size: 16,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
