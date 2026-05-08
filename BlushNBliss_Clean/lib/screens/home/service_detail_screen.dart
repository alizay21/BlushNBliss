import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/core_models.dart';
import '../../constants/app_colors.dart';
import '../../providers/app_state_provider.dart';
import '../../widgets/stylist_card.dart';

class ServiceDetailScreen extends StatelessWidget {
  final ServiceModel service;

  const ServiceDetailScreen({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final stylists = Provider.of<AppStateProvider>(context).getStylistsForService(service.id);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(service.name),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        titleTextStyle: theme.titleLarge?.copyWith(color: AppColors.textPrimary),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service header image placeholder
            Container(
              height: 200,
              width: double.infinity,
              color: AppColors.warmBeige,
              child: const Icon(Icons.spa, size: 80, color: Colors.white),
            ),
            
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(service.name, style: theme.displaySmall),
                      Text('Rs. ${service.startingPrice.toInt()}', style: theme.titleLarge?.copyWith(color: AppColors.mutedMauve)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 16, color: AppColors.textSecondary),
                      const SizedBox(width: 4),
                      Text('${service.durationMinutes} mins', style: theme.bodyMedium),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  Text('Description', style: theme.titleLarge),
                  const SizedBox(height: 8),
                  Text(service.description, style: theme.bodyLarge),
                  const SizedBox(height: 24),
                  
                  Text('What\'s included', style: theme.titleLarge),
                  const SizedBox(height: 8),
                  ...service.inclusions.map((item) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.check_circle, color: AppColors.mutedMauve, size: 20),
                        const SizedBox(width: 8),
                        Text(item, style: theme.bodyLarge),
                      ],
                    ),
                  )),
                  const SizedBox(height: 32),
                  
                  Text('Available Stylists', style: theme.titleLarge),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            
            // Stylists horizontal scroll
            SizedBox(
              height: 220,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                scrollDirection: Axis.horizontal,
                itemCount: stylists.length,
                itemBuilder: (context, index) {
                  return StylistCard(stylist: stylists[index]);
                },
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
