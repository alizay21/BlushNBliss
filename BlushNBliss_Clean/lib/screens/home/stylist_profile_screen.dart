import 'package:flutter/material.dart';
import '../../models/market_models.dart';
import '../../constants/app_colors.dart';
import '../booking/booking_screen.dart'; // To be implemented

class StylistProfileScreen extends StatelessWidget {
  final StylistModel stylist;

  const StylistProfileScreen({Key? key, required this.stylist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(stylist.name),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        titleTextStyle: theme.titleLarge?.copyWith(color: AppColors.textPrimary),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: AppColors.warmBeige,
                    child: const Icon(Icons.person, size: 70, color: Colors.white), // Image placeholder
                  ),
                  const SizedBox(height: 16),
                  Text(stylist.name, style: theme.displaySmall),
                  const SizedBox(height: 4),
                  Text(stylist.specialty, style: theme.bodyLarge?.copyWith(color: AppColors.textSecondary)),
                  const SizedBox(height: 12),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 24),
                      const SizedBox(width: 4),
                      Text('${stylist.rating}', style: theme.titleLarge),
                      Text(' (${stylist.reviewCount} reviews)', style: theme.bodyMedium),
                      const SizedBox(width: 24),
                      Text('${stylist.experienceYears} Years Exp.', style: theme.titleLarge?.copyWith(color: AppColors.mutedMauve)),
                    ],
                  ),
                ],
              ),
            ),
            
            // Services Tags
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Services Offered', style: theme.titleLarge),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: stylist.serviceIds.map((id) => Chip(
                      label: Text(id), // Ideally fetch service name from provider
                      backgroundColor: AppColors.dustyRose.withOpacity(0.3),
                      labelStyle: theme.bodyMedium,
                    )).toList(),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Portfolio
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Portfolio', style: theme.titleLarge),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: 4, // Placeholder for portfolio items
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          color: AppColors.warmBeige,
                          child: const Icon(Icons.image, color: Colors.white, size: 40),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100), // padding for bottom button
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(24),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => BookingScreen(stylist: stylist)),
              );
            },
            child: const Text('Book Appointment'),
          ),
        ),
      ),
    );
  }
}
