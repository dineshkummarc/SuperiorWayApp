import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FeePaymentScreen extends StatefulWidget {
  const FeePaymentScreen({super.key});

  @override
  _FeePaymentScreenState createState() => _FeePaymentScreenState();
}

class _FeePaymentScreenState extends State<FeePaymentScreen> {
  // Controllers for text fields
  final _amountController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();

  // List to store payment history
  final List<Map<String, String>> _paymentHistory = [
    {'date': '2023-10-01', 'amount': '\$50.00', 'status': 'Success'},
    {'date': '2023-09-15', 'amount': '\$50.00', 'status': 'Success'},
    {'date': '2023-08-10', 'amount': '\$50.00', 'status': 'Failed'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fee Payment'),
        backgroundColor: Colors.blue.shade800, // Match the app theme
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Payment Form
              Text(
                'Make a Payment',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Enter your payment details below.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 20),
              // Amount Field
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.attach_money),
                ),
              ),
              SizedBox(height: 16),
              // Card Number Field
              TextField(
                controller: _cardNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Card Number',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.credit_card),
                ),
              ),
              SizedBox(height: 16),
              // Expiry Date and CVV Fields
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _expiryDateController,
                      decoration: InputDecoration(
                        labelText: 'Expiry Date (MM/YY)',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      controller: _cvvController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'CVV',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Pay Now Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _processPayment();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade800, // Match the app theme
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Pay Now',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 30),
              // Payment History
              Text(
                'Payment History',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800,
                ),
              ),
              SizedBox(height: 10),
              ..._paymentHistory.map((payment) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: Icon(
                      payment['status'] == 'Success'
                          ? Icons.check_circle
                          : Icons.error,
                      color: payment['status'] == 'Success'
                          ? Colors.green
                          : Colors.red,
                    ),
                    title: Text('Amount: ${payment['amount']}'),
                    subtitle: Text('Date: ${payment['date']}'),
                    trailing: Text(
                      payment['status']!,
                      style: TextStyle(
                        color: payment['status'] == 'Success'
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  // Function to process payment
  void _processPayment() {
    // Get values from controllers
    String amount = _amountController.text.trim();
    String cardNumber = _cardNumberController.text.trim();
    String expiryDate = _expiryDateController.text.trim();
    String cvv = _cvvController.text.trim();

    // Basic validation
    if (amount.isEmpty ||
        cardNumber.isEmpty ||
        expiryDate.isEmpty ||
        cvv.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Simulate payment processing (you can replace this with an API call)
    if (kDebugMode) {
      print('Payment Processed:');
    }
    if (kDebugMode) {
      print('Amount: $amount');
    }
    if (kDebugMode) {
      print('Card Number: $cardNumber');
    }
    if (kDebugMode) {
      print('Expiry Date: $expiryDate');
    }
    if (kDebugMode) {
      print('CVV: $cvv');
    }

    // Add payment to history
    setState(() {
      _paymentHistory.insert(0, {
        'date': '2023-10-10', // Use current date
        'amount': '\$$amount',
        'status': 'Success',
      });
    });

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Payment successful!'),
        backgroundColor: Colors.green,
      ),
    );

    // Clear the form
    _amountController.clear();
    _cardNumberController.clear();
    _expiryDateController.clear();
    _cvvController.clear();
  }
}