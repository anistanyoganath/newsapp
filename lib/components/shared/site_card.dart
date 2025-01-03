import 'package:flutter/material.dart';
import 'package:newsapp/models/site_model.dart';
import 'package:newsapp/screens/site_screen.dart';
import 'package:newsapp/utils/favourite_sites.dart';

class SiteCard extends StatefulWidget {
  final SiteModel site;
  const SiteCard({super.key, required this.site});

  @override
  State<SiteCard> createState() => _SiteCardState();
}

class _SiteCardState extends State<SiteCard> {
  final favouritestore = FavouriteSitesStore();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SiteScreen(site: widget.site),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
              image: DecorationImage(
                image: AssetImage("assets/images/${widget.site.image}"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(186, 0, 0, 0),
                        Color.fromARGB(126, 129, 123, 123),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      right: 12,
                      bottom: 5,
                      top: 5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.site.name} - ${widget.site.language.name}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          widget.site.description,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(214, 255, 255, 255),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: FutureBuilder<bool>(
              future: favouritestore.isFavourite(widget.site),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  bool isFavourite = snapshot.data!;
                  return IconButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Colors.black45,
                      ),
                    ),
                    icon: Icon(
                      isFavourite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      if (isFavourite) {
                        await favouritestore.removeFavouriteSite(widget.site);
                      } else {
                        await favouritestore.addFavouriteSite(widget.site);
                      }
                      setState(() {});
                    },
                  );
                } else {
                  return IconButton(
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      await favouritestore.addFavouriteSite(widget.site);
                      setState(() {});
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
