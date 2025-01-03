import 'package:flutter/material.dart';
import 'package:newsapp/models/site_model.dart';
import 'package:newsapp/utils/favourite_sites.dart';
import 'package:newsapp/components/shared/site_card.dart';

class FavouriteSitesScreen extends StatelessWidget {
  final FavouriteSitesStore favouriteStore = FavouriteSitesStore();

  FavouriteSitesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite Sites"),
      ),
      body: ValueListenableBuilder<List<SiteModel>>(
        valueListenable: favouriteStore.favouriteSitesNotifier,
        builder: (context, favouriteSites, _) {
          return favouriteSites.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: 80,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "No favorite sites added yet.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(20),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 3 / 3,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: favouriteSites.length,
                    itemBuilder: (context, index) {
                      final site = favouriteSites[index];
                      return SiteCard(
                        site: site,
                      );
                    },
                  ),
                );
        },
      ),
    );
  }
}
