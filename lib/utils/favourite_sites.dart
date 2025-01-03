import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:newsapp/models/site_model.dart';

final box = Hive.box('appData');

class FavouriteSitesStore {
  ValueNotifier<List<SiteModel>> favouriteSitesNotifier = ValueNotifier([]);

  FavouriteSitesStore() {
    _loadFavouriteSites();
  }

  Future<void> _loadFavouriteSites() async {
    final sites = await getFavouriteSites();
    favouriteSitesNotifier.value = sites;
  }

  Future<void> addFavouriteSite(SiteModel site) async {
    final sites = await getFavouriteSites();
    sites.add(site);
    await box.put('fav_sites', sites);
    favouriteSitesNotifier.value = sites;
  }

  Future<List<SiteModel>> getFavouriteSites() async {
    final sites = box.get('fav_sites', defaultValue: []);
    if (sites == null) {
      return [];
    }
    return List<SiteModel>.from(sites);
  }

  Future<bool> isFavourite(SiteModel site) async {
    final sites = await getFavouriteSites();
    return sites.any((s) => s.name == site.name);
  }

  Future<void> removeFavouriteSite(SiteModel site) async {
    final sites = await getFavouriteSites();
    sites.removeWhere((s) => s.name == site.name);
    await box.put('fav_sites', sites);
    favouriteSitesNotifier.value = sites;
  }
}
