import 'package:flutter/material.dart';
import 'package:newsapp/components/shared/section_title.dart';
import 'package:newsapp/components/shared/site_card.dart';
import 'package:newsapp/const/sites.dart';

class AllSitesScreen extends StatelessWidget {
  const AllSitesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SectionTitle(
          title: "All Sites",
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(18),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 10,
                  childAspectRatio: 3 / 1.5,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: sites.length,
                itemBuilder: (context, index) => SiteCard(
                  site: sites[index],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
