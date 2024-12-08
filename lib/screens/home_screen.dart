import 'package:flutter/material.dart';
import 'package:newsapp/components/home/app_name.dart';
import 'package:newsapp/components/home/top_sites.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            AppName(),
            SizedBox(height: 20,),
            TopSites(),
          ],
        ),
      ),
    );
  }
}
