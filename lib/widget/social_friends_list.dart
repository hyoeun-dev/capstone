import 'package:capstone/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SocialFriendsList extends StatelessWidget {
  final String name;

  const SocialFriendsList({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(shape: BoxShape.circle, color: blackColor.withAlpha(60)),
          child: Icon(CupertinoIcons.person_fill),
        ),
        Padding(padding: EdgeInsets.only(bottom: 3)),
        Text(name),
      ],
    );
  }
}
