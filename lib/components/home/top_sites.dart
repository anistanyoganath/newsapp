import 'package:flutter/material.dart';
import 'package:newsapp/components/shared/section_title.dart';
import 'package:newsapp/components/shared/site_card_wide.dart';
import 'package:newsapp/const/sites.dart';
import 'package:newsapp/screens/all_sites_screen.dart';

class TopSites extends StatelessWidget {
  const TopSites({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Row(
          children: [
            SectionTitle(title: "Top Sites", color: Colors.black),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 3 / 3,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(), //
            itemCount: sites.take(4).length,
            itemBuilder: (context, index) {
              final site = sites[index];
              return SiteCardWide(site: site);
            },
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AllSitesScreen(),
              ),
            );
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            child: Text(
              "View More",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SizedBox(
            height: 20,
          ),
      ],
    );
  }
}
