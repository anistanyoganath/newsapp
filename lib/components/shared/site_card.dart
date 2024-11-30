import 'package:flutter/material.dart';
import 'package:newsapp/models/site_model.dart';
import 'package:newsapp/screens/site_screen.dart';

class SiteCard extends StatelessWidget {
  final SiteModel site;
  const SiteCard({super.key, required this.site});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SiteScreen(
                      site: site,
                    )));
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4, // Added elevation for a more professional look
        shadowColor: Colors.black.withOpacity(0.3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12), // Rounded corners for images
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 3, 
                height: MediaQuery.of(context).size.width / 3,
                child: Image.asset(
                  "assets/images/${site.image}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8), // Added spacing between image and text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                site.name,
                overflow: TextOverflow.ellipsis, // Avoid text overflow
                maxLines: 1, // Keeps title on a single line
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600, // Slightly lighter for better readability
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 8), // Added space below text
          ],
        ),
      ),
    );
  }
}
