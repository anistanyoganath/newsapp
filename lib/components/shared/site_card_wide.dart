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
                builder: (context) => SiteScreen (
                      site: site,
                    )));
      },
      child: Container(
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
              gradient: LinearGradient(
                colors: [site.bgColor, site.bgColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundColor: site.fgColor,
                      radius: 30,
                      backgroundImage: NetworkImage(site.image),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            site.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: site.fgColor),
                          ),
                          Text(
                            "Visit ${site.name} website",
                            style: TextStyle(color: site.fgColor),
                            overflow: TextOverflow.clip,
                          )
                        ],
                      ),
                    ),
                    IconButton(
                        color: site.fgColor,
                        iconSize: 20,
                        onPressed: null,
                        icon: Icon(
                          Icons.arrow_right_alt,
                          color: site.fgColor,
                        ))
                  ],
                )
              ],
            ),
          )),
    );
  }
}