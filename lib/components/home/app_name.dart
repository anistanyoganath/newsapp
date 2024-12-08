import 'package:flutter/material.dart';

class AppName extends StatelessWidget {
  const AppName({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
          ),
          Text(
            "News",
            style: TextStyle(fontSize: MediaQuery.of(context).size.width / 6),
          ),
          const Divider(
            color: Colors.orange,
            thickness: 8,
          )
        ],
      ),
    );
  }
}
