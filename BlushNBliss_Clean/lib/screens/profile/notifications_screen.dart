import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../widgets/organic_blob_background.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: Theme.of(context).textTheme.displaySmall,
      ),
      body: OrganicBlobBackground(
        child: ListView.builder(
          padding: const EdgeInsets.all(24),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: CircleAvatar(
                  backgroundColor: AppColors.dustyRose.withOpacity(0.3),
                  child: const Icon(Icons.notifications, color: AppColors.mutedMauve),
                ),
                title: const Text('Booking Confirmed!'),
                subtitle: const Text('Your appointment with Zara Khan is confirmed for 10:00 AM.'),
                trailing: const Text('2m ago', style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
              ),
            );
          },
        ),
      ),
    );
  }
}
