import 'dart:async';
import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../widgets/organic_blob_background.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to Login after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const AuthScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return OrganicBlobBackground(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Line art illustration placeholder
            Icon(
              Icons.face_retouching_natural,
              size: 100,
              color: AppColors.mutedMauve,
            ).animate().fade(duration: 800.ms).scale(),
            
            const SizedBox(height: 30),
            
            Text(
              'Blush & Bliss',
              style: theme.displayLarge?.copyWith(
                fontSize: 42,
                color: AppColors.textPrimary,
                letterSpacing: 1.2,
              ),
            ).animate().fade(delay: 400.ms, duration: 800.ms).slideY(),
            
            const SizedBox(height: 15),
            
            Text(
              'Where Your\nBeauty Shines\nBright',
              textAlign: TextAlign.center,
              style: theme.bodyLarge?.copyWith(
                fontSize: 20,
                color: AppColors.textSecondary,
                height: 1.4,
              ),
            ).animate().fade(delay: 800.ms, duration: 800.ms).slideY(),
          ],
        ),
      ),
    );
  }
}
