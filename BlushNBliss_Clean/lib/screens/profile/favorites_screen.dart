import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/app_colors.dart';
import '../../widgets/organic_blob_background.dart';
import '../../providers/app_state_provider.dart';
import '../../widgets/stylist_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppStateProvider>(context);
    final favorites = appState.favoriteStylists;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: Theme.of(context).textTheme.displaySmall,
      ),
      body: OrganicBlobBackground(
        child: favorites.isEmpty
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.favorite_border, size: 80, color: AppColors.dustyRose),
                    const SizedBox(height: 16),
                    Text(
                      'No favorites yet',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              )
            : GridView.builder(
                padding: const EdgeInsets.all(24),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  return StylistCard(stylist: favorites[index]);
                },
              ),
      ),
    );
  }
}
