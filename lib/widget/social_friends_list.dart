import 'package:capstone/colors.dart';
import 'package:flutter/material.dart';

class SocialFriendsList extends StatelessWidget {
  final String name;

  const SocialFriendsList({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10), // Adjusted padding
          decoration: BoxDecoration(
            shape: BoxShape.rectangle, // Changed to rectangle
            color: blackColor.withAlpha(26), // Adjusted opacity
          ),
          child: Icon(Icons.person, color: blackColor), // Replaced icon
        ),
        Padding(padding: EdgeInsets.only(bottom: 3)),
        Text(name, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
