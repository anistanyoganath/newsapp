import 'package:flutter/material.dart';
import 'package:newsapp/models/site_model.dart';
import 'package:newsapp/screens/site_screen.dart';

class SiteCardWide extends StatelessWidget {
  final SiteModel site;
  const SiteCardWide({super.key, required this.site});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SiteScreen(
                      site: site,
                    )));
      },
      child: Container(
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
                  image: AssetImage("assets/images/${site.image}"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(186, 0, 0, 0),
                      Color.fromARGB(126, 129, 123, 123)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, bottom: 5, top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${site.name} - ${site.language.name}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      Text(
                        site.description,
                        style: const TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(214, 255, 255, 255)),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
