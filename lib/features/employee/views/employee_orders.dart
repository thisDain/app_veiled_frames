import 'package:flutter/material.dart';
import 'package:veiled_frames/core/constants/app_colors.dart';
import 'package:veiled_frames/core/constants/orders.dart';
import 'package:veiled_frames/features/employee/views/employee_orderdetails.dart';
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
    selectedStatus = statusOptions.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
                    color: AppColors.secondary,
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
                      width: 12,
                      decoration: BoxDecoration(
                        color: AppColors.rosewoodMauve,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),
                Scrollbar(
                  thickness: 8,
                  radius: const Radius.circular(10),
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
                        ),
                        trackColor: WidgetStateProperty.all(
                          AppColors.dustyBlush,
                        ),
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
                          height: 100,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "Order No.: ${order['order_no']}",
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Spacer(),
                                    SizedBox(
                                      width: 70,
                                      height: 20,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) => OrderDetails(),
                                            ),
                                          );
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStateProperty.all(
                                                AppColors.secondary,
                                              ),
                                          shape: WidgetStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                            ),
                                          ),
                                          padding: WidgetStateProperty.all(
                                            EdgeInsets.symmetric(
                                              vertical: 3,
                                              horizontal: 2,
                                            ),
                                          ),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          IconText(
                                            icon: Icons.person,
                                            text: order['customer_name'],
                                            size: 10,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          IconText(
                                            icon: Icons.attach_money,
                                            text:
                                                "Payable: ${order['payable']}",
                                            size: 10,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          IconText(
                                            icon: Icons.calendar_month,
                                            text:
                                                "Order on: ${order['order_date']}",
                                            size: 10,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          IconText(
                                            icon: Icons.phone,
                                            text: order['contact'],
                                            size: 10,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          IconText(
                                            icon: Icons.location_pin,
                                            text: order['location'],
                                            size: 10,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          IconText(
                                            icon: Icons.delivery_dining,
                                            text: order['delivery_type'],
                                            size: 10,
                                            overflow: TextOverflow.ellipsis,
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
