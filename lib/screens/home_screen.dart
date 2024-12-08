import 'package:flutter/material.dart';
import 'package:newsapp/components/home/app_name.dart';
import 'package:newsapp/components/home/top_sites.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert),
          onSelected: (value) {
            if (value == 'fav_sites') {}
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
              const PopupMenuItem(
                value: 'theme',
                child: Row(
                  children: [
                    Icon(Icons.dark_mode),
                    SizedBox(width: 8),
                    Text('Toggle theme'),
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
