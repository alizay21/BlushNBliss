import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../widgets/organic_blob_background.dart';

class AppointmentHistoryScreen extends StatelessWidget {
  const AppointmentHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointments'),
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: Theme.of(context).textTheme.displaySmall,
      ),
      body: OrganicBlobBackground(
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              const TabBar(
                isScrollable: true,
                labelColor: AppColors.mutedMauve,
                unselectedLabelColor: AppColors.textSecondary,
                indicatorColor: AppColors.mutedMauve,
                tabs: [
                  Tab(text: 'All'),
                  Tab(text: 'Upcoming'),
                  Tab(text: 'Completed'),
                  Tab(text: 'Cancelled'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildEmptyState('No appointments found.'),
                    _buildEmptyState('No upcoming appointments.'),
                    _buildEmptyState('No completed appointments.'),
                    _buildEmptyState('No cancelled appointments.'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(String message) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.event_busy, size: 80, color: AppColors.dustyRose),
          const SizedBox(height: 16),
          Text(message, style: const TextStyle(color: AppColors.textSecondary)),
        ],
      ),
    );
  }
}
