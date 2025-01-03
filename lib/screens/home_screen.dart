import 'package:flutter/material.dart';
import 'package:newsapp/components/home/app_name.dart';
import 'package:newsapp/components/home/top_sites.dart';
import 'package:newsapp/screens/favourite_sites_screen.dart';
import 'package:newsapp/utils/share.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:newsapp/utils/theme_store.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkTheme = ThemeStore.isDarkTheme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert),
          onSelected: (value) async {
            if (value == 'fav_sites') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FavouriteSitesScreen()));
            } else if (value == "theme") {
              setState(() {
                isDarkTheme = !isDarkTheme;
              });
              ThemeStore.toggleTheme();
            } else if (value == "share") {
              shareApp();
            } else if (value == "review") {
              final InAppReview inAppReview = InAppReview.instance;
              if (await inAppReview.isAvailable()) {
                inAppReview.requestReview();
              }
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: 'fav_sites',
                child: Row(
                  children: [
                    Icon(Icons.favorite_outline),
                    SizedBox(width: 8),
                    Text('Favourite sites'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'theme',
                child: Row(
                  children: [
                    Icon(isDarkTheme
                        ? Icons.dark_mode
                        : Icons.dark_mode_outlined),
                    const SizedBox(width: 8),
                    const Text('Toggle theme'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'share',
                child: Row(
                  children: [
                    Icon(Icons.share_sharp),
                    SizedBox(width: 8),
                    Text('Share App'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'review',
                child: Row(
                  children: [
                    Icon(Icons.reviews_outlined),
                    SizedBox(width: 8),
                    Text('Review'),
                  ],
                ),
              ),
            ];
          },
        ),
      ]),
      body: const Column(
        children: [
          AppName(),
          SizedBox(
            height: 20,
          ),
          TopSites(),
        ],
      ),
    );
  }
}
