import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/app_colors.dart';
import '../../widgets/organic_blob_background.dart';
import '../../providers/auth_provider.dart';
import '../auth/auth_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authState = Provider.of<AppAuthProvider>(context);
    final user = authState.currentUser;
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: theme.displaySmall,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: AppColors.textPrimary),
            onPressed: () {},
          )
        ],
      ),
      body: OrganicBlobBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              // Avatar
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.dustyRose, width: 4),
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.mutedMauve,
                  child: const Icon(Icons.person, size: 60, color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              Text(user?.name ?? 'Guest User', style: theme.displaySmall),
              const SizedBox(height: 32),

              // Menu Options Card
              Card(
                color: AppColors.cardColor,
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    _buildMenuItem(context, title: 'Account Info', icon: Icons.person_outline),
                    _buildDivider(),
                    _buildMenuItem(context, title: 'Appointment History', icon: Icons.history),
                    _buildDivider(),
                    _buildMenuItem(context, title: 'Notifications', icon: Icons.notifications_active_outlined),
                    _buildDivider(),
                    _buildMenuItem(context, title: 'Settings', icon: Icons.settings_outlined),
                    _buildDivider(),
                    _buildMenuItem(context, title: 'Invite Friends', icon: Icons.group_add_outlined),
                    _buildDivider(),
                    _buildMenuItem(context, title: 'Help Center', icon: Icons.help_outline),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              
              // Sign Out Button
              ElevatedButton.icon(
                onPressed: () async {
                  await authState.logout();
                  if (context.mounted) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const AuthScreen()),
                      (route) => false,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.dustyRose,
                  foregroundColor: AppColors.textPrimary,
                  minimumSize: const Size(double.infinity, 50),
                ),
                icon: const Icon(Icons.logout),
                label: const Text('Sign out'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, {required String title, required IconData icon}) {
    return ListTile(
      leading: Icon(icon, color: AppColors.mutedMauve),
      title: Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.textSecondary),
      onTap: () {
        // Navigation placeholder
      },
    );
  }

  Widget _buildDivider() {
    return Divider(height: 1, color: AppColors.textSecondary.withOpacity(0.2), indent: 16, endIndent: 16);
  }
}
