// payment_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Map<String, dynamic>? orderData;
  String? selectedTimeSlot;
  bool isLoading = false;
  DateTime? selectedDate;
  DateTime currentDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    loadOrderData();
  }

  Future<void> _selectDate(BuildContext context) async {
    // Calculate date range (e.g., allow selection up to 2 weeks ahead)
    final lastDate = DateTime.now().add(const Duration(days: 14));
    
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? currentDate,
      firstDate: currentDate,
      lastDate: lastDate,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.brown, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.brown, // Calendar text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.brown, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        selectedTimeSlot = null; // Reset time slot when date changes
      });
    }
  }

    String _formatDate(DateTime date) {
    // Format like "Monday, Dec 24"
    final List<String> weekdays = [
      'Monday', 'Tuesday', 'Wednesday', 
      'Thursday', 'Friday', 'Saturday', 'Sunday'
    ];
    final List<String> months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    
    final weekday = weekdays[date.weekday - 1];
    final month = months[date.month - 1];
    return '$weekday, $month ${date.day}';
  }

  Future<void> loadOrderData({bool forceRefresh = false}) async {
    if (isLoading && !forceRefresh) return;

    setState(() {
      isLoading = true;
    });

    try {
      // Add artificial delay to show loading state
      if (forceRefresh) {
        await Future.delayed(const Duration(milliseconds: 500));
      }
      
      final String response = await rootBundle.loadString('assets/payment_data.json');
      final data = await json.decode(response);
      
      setState(() {
        orderData = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error loading data: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> refreshData() async {
    return loadOrderData(forceRefresh: true);
  }

  AppBar _buildAppBar() {
  return AppBar(
    title: const Text('Payment'),
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    ),
  );
}


  Widget _buildDeliveryLocation() {
    if (orderData == null) return const SizedBox.shrink();

    final location = orderData!['delivery_location'];
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.brown.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Delivery Location',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Change',
                  style: TextStyle(color: Colors.brown),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.brown),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '${location['floor']}, '
                  '${location['building']}\n'
                  '${location['area']}',
                  style: const TextStyle(color: Colors.brown),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDateTimePicker() {
    if (orderData == null) return const SizedBox.shrink();

    final timeSlots = orderData!['time_slots'] as List;
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.brown.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Expected date & Time',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
          ),
          const SizedBox(height: 16),
          // Date Selection Button
          InkWell(
            onTap: () => _selectDate(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.brown.shade200),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today, color: Colors.brown, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      selectedDate != null
                          ? _formatDate(selectedDate!)
                          : 'Select Date',
                      style: TextStyle(
                        color: Colors.brown,
                        fontWeight: selectedDate != null 
                            ? FontWeight.bold 
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                  const Icon(Icons.arrow_drop_down, color: Colors.brown),
                ],
              ),
            ),
          ),
          if (selectedDate != null) ...[
            const SizedBox(height: 16),
            const Text(
              'Available Time Slots',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: timeSlots.map<Widget>((time) {
                return ChoiceChip(
                  label: Text(time.toString()),
                  selected: selectedTimeSlot == time,
                  onSelected: (selected) {
                    setState(() {
                      selectedTimeSlot = selected ? time : null;
                    });
                  },
                  backgroundColor: Colors.white,
                  selectedColor: Colors.brown.shade200,
                  labelStyle: TextStyle(
                    color: selectedTimeSlot == time 
                        ? Colors.brown 
                        : Colors.brown.shade700,
                  ),
                );
              }).toList(),
            ),
          ],
          if (selectedDate != null && selectedTimeSlot != null) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.green.shade100),
              ),
              child: Row(
                children: [
                  Icon(Icons.check_circle, 
                       color: Colors.green.shade700, 
                       size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'Delivery set for ${_formatDate(selectedDate!)} at $selectedTimeSlot',
                    style: TextStyle(
                      color: Colors.green.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInStorePickup() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.brown.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'In-Store Pick Up',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                Text(
                  'Some Stores May Be Temporarily Unavalable.',
                  style: TextStyle(color: Colors.brown),
                ),
              ],
            ),
          ),
          const Text(
            'FREE',
            style: TextStyle(
              color: Colors.brown,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethods() {
    if (orderData == null) return const SizedBox.shrink();

    final paymentMethods = orderData!['payment_methods'] as List;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.brown.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Payment Method',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
          ),
          ...paymentMethods.map<Widget>((method) {
            return ListTile(
              leading: Icon(
                method['type'] == 'apple_pay' ? Icons.apple : Icons.attach_money,
                color: Colors.brown,
              ),
              title: Text(
                method['name'],
                style: const TextStyle(color: Colors.brown),
              ),
              trailing: method['isSelected']
                  ? const Icon(Icons.check, color: Colors.green)
                  : null,
              onTap: () {
                setState(() {
                  for (var m in paymentMethods) {
                    m['isSelected'] = m == method;
                  }
                });
              },
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildOrderSummary() {
    if (orderData == null) return const SizedBox.shrink();

    final summary = orderData!['order_summary'];
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.brown.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Order Summary',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
          ),
          const SizedBox(height: 16),
          _buildSummaryRow('Subtotal', summary['subtotal']),
          _buildSummaryRow('Tax', summary['tax']),
          _buildSummaryRow('Delivery Price', summary['delivery_price']),
          const Divider(color: Colors.brown),
          _buildSummaryRow('Total:', summary['total'], isBold: true),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, dynamic amount, {bool isBold = false}) {
    final textStyle = TextStyle(
      color: Colors.brown,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontSize: isBold ? 18 : 14,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: textStyle),
          Text(
            '\$${amount.toStringAsFixed(2)}',
            style: textStyle,
          ),
        ],
      ),
    );
  }

  @override
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: _buildAppBar(),
    body: RefreshIndicator(
      onRefresh: refreshData,
      child: orderData == null && isLoading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.brown),
              ),
            )
          : SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDeliveryLocation(),
                  const SizedBox(height: 16),
                  _buildDateTimePicker(),
                  const SizedBox(height: 16),
                  _buildInStorePickup(),
                  const SizedBox(height: 16),
                  _buildPaymentMethods(),
                  const SizedBox(height: 16),
                  _buildOrderSummary(),
                  const SizedBox(height: 24),
                  if (orderData != null)
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle checkout
                          print(
                              'Checkout pressed with total: ${orderData!['order_summary']['total']}');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'CheckOut \$${orderData!['order_summary']['total']}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
    ),
    bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.brown,
      unselectedItemColor: Colors.grey,
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Shop"),
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "Account"),
      ],
      onTap: (index) {
        // Handle navigation based on index
      },
    ),
  );
}
  
}