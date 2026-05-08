import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../models/market_models.dart';
import 'success_screen.dart';

class PaymentScreen extends StatefulWidget {
  final double amount;
  final StylistModel stylist;
  final DateTime date;
  final String time;

  const PaymentScreen({
    Key? key,
    required this.amount,
    required this.stylist,
    required this.date,
    required this.time,
  }) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedMethod = 'Credit/Debit Card';
  
  final List<String> _methods = [
    'Credit/Debit Card',
    'EasyPaisa',
    'JazzCash',
    'Cash on Service'
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Payment'),
        backgroundColor: AppColors.background,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        titleTextStyle: theme.titleLarge?.copyWith(color: AppColors.textPrimary),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Summary
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order Summary', style: theme.titleLarge),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Stylist'),
                        Text(widget.stylist.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Date & Time'),
                        Text('${widget.date.toLocal().toString().split(' ')[0]} at ${widget.time}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total', style: theme.titleLarge),
                        Text('Rs. ${widget.amount.toInt()}', style: theme.headlineMedium?.copyWith(color: AppColors.mutedMauve)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            Text('Payment Method', style: theme.titleLarge),
            const SizedBox(height: 16),
            ..._methods.map((method) => RadioListTile<String>(
              title: Text(method),
              value: method,
              groupValue: _selectedMethod,
              activeColor: AppColors.mutedMauve,
              onChanged: (val) => setState(() => _selectedMethod = val!),
            )).toList(),
            
            if (_selectedMethod == 'Credit/Debit Card') ...[
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Card Number', filled: true, fillColor: Colors.white),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: TextFormField(decoration: const InputDecoration(hintText: 'Expiry (MM/YY)', filled: true, fillColor: Colors.white))),
                  const SizedBox(width: 16),
                  Expanded(child: TextFormField(decoration: const InputDecoration(hintText: 'CVV', filled: true, fillColor: Colors.white), obscureText: true)),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Cardholder Name', filled: true, fillColor: Colors.white),
              ),
            ],
            
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => SuccessScreen(
                      amount: widget.amount,
                      stylistName: widget.stylist.name,
                      date: widget.date,
                      time: widget.time,
                      method: _selectedMethod,
                    )),
                  );
                },
                child: const Text('Pay Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
