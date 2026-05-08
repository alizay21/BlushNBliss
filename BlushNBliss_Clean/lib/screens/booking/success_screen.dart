import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../utils/pdf_generator.dart';
import '../main_wrapper.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SuccessScreen extends StatelessWidget {
  final double amount;
  final String stylistName;
  final DateTime date;
  final String time;
  final String method;

  const SuccessScreen({
    Key? key,
    required this.amount,
    required this.stylistName,
    required this.date,
    required this.time,
    required this.method,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                color: AppColors.success,
                size: 120,
              ).animate().scale(duration: 500.ms, curve: Curves.easeOutBack),
              
              const SizedBox(height: 24),
              Text(
                'Booking Confirmed!',
                style: theme.displaySmall?.copyWith(color: AppColors.success),
                textAlign: TextAlign.center,
              ).animate().fade(delay: 500.ms),
              
              const SizedBox(height: 16),
              Text(
                'Your appointment has been successfully booked.',
                style: theme.bodyLarge,
                textAlign: TextAlign.center,
              ).animate().fade(delay: 800.ms),
              
              const SizedBox(height: 48),
              
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Generate and show PDF receipt
                    PdfGenerator.generateAndPrintReceipt(
                      amount: amount,
                      stylistName: stylistName,
                      date: date,
                      time: time,
                      method: method,
                      bookingId: 'BB-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
                    );
                  },
                  icon: const Icon(Icons.receipt_long),
                  label: const Text('View/Print Receipt'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.dustyRose,
                    foregroundColor: AppColors.textPrimary,
                  ),
                ),
              ).animate().fade(delay: 1100.ms),
              
              const SizedBox(height: 16),
              
              TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const MainWrapper()),
                    (route) => false,
                  );
                },
                child: Text('Back to Home', style: theme.bodyMedium?.copyWith(color: AppColors.mutedMauve, fontWeight: FontWeight.bold)),
              ).animate().fade(delay: 1300.ms),
            ],
          ),
        ),
      ),
    );
  }
}
