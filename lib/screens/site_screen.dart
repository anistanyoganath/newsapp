import 'package:flutter/material.dart';
import 'package:newsapp/components/shared/banner_advert.dart';
import 'package:newsapp/models/site_model.dart';
import 'package:newsapp/screens/site_view_screen.dart';
import 'package:newsapp/utils/favourite_sites.dart';

class SiteScreen extends StatefulWidget {
  final SiteModel site;

  const SiteScreen({super.key, required this.site});

  @override
  State<SiteScreen> createState() => _SiteScreenState();
}

class _SiteScreenState extends State<SiteScreen> {
  bool isFavourite = false;
  final favouriteStore = FavouriteSitesStore();

  @override
  void initState() {
    favouriteStore.isFavourite(widget.site).then((value) {
      setState(() {
        isFavourite = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.site.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: widget.site.bgColor,
        foregroundColor: widget.site.fgColor,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isFavourite ? Icons.favorite_border : Icons.favorite),
            onPressed: () {
              if (isFavourite) {
                favouriteStore.removeFavouriteSite(widget.site);
                setState(() {
                  isFavourite = false;
                });
              } else {
                favouriteStore.addFavouriteSite(widget.site);
                setState(() {
                  isFavourite = true;
                });
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Banner Image
            Stack(
              children: [
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/${widget.site.image}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      widget.site.language.name.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Details Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    widget.site.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Description with background
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      widget.site.description,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Center(child: BannerAdvert())
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 25),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SiteViewScreen(site: widget.site)));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Button color
            padding: const EdgeInsets.symmetric(
              vertical: 12,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Visit Website',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
