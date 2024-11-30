import 'package:flutter/material.dart';
import 'package:newsapp/components/shared/section_title.dart';
import 'package:newsapp/components/shared/site_card.dart';
import 'package:newsapp/const/sites.dart';
import 'package:newsapp/screens/all_sites_screen.dart';

class TopSites extends StatelessWidget {
  const TopSites({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: "Top Sites", color: Colors.black),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...sites.take(3).map((site) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SiteCard(site: site),
                );
              }),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AllSitesScreen(),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 4,
                  color: Colors.blueAccent,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16.0),
                    child: Text(
                      "View More",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
