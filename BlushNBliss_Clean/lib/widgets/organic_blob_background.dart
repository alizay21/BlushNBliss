import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class OrganicBlobBackground extends StatelessWidget {
  final Widget child;
  
  const OrganicBlobBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Top Left Blob
          Positioned(
            top: -100,
            left: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: AppColors.dustyRose.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Bottom Right Blob
          Positioned(
            bottom: -150,
            right: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                color: AppColors.warmBeige.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Middle Left small Blob
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            left: -80,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: AppColors.blushPink.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Content
          SafeArea(child: child),
        ],
      ),
    );
  }
}
