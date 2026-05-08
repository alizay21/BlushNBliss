import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../models/core_models.dart';
import '../../screens/home/service_detail_screen.dart';

class ServiceCard extends StatelessWidget {
  final ServiceModel service;

  const ServiceCard({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ServiceDetailScreen(service: service)),
        );
      },
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: AppColors.mutedMauve.withOpacity(0.1),
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.mutedMauve.withOpacity(0.3), width: 1),
            ),
            padding: const EdgeInsets.all(16),
            child: const Icon(Icons.spa, color: AppColors.mutedMauve, size: 30), // Placeholder for image
          ),
          const SizedBox(height: 8),
          Text(
            service.name,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
