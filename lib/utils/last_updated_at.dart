import 'package:hive/hive.dart';
import 'package:newsapp/models/site_model.dart';

final box = Hive.box('appData');

class Store {
  static Future<void> addFavouriteSite(SiteModel site) async {
    final sites = await getFavouriteSites();
    sites.add(site);
    await box.put('fav_sites', sites);
  }

  static Future<List<SiteModel>> getFavouriteSites() async {
    final sites = box.get('fav_sites', defaultValue: []);
    if (sites == null) {
      return [];
    }
    return sites;
  }
}
