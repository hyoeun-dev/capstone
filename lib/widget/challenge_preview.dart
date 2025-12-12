import 'package:capstone/colors.dart';
import 'package:capstone/constants.dart';
import 'package:flutter/material.dart';

class ChallengePreview extends StatelessWidget {
  String title;
  String tag;
  ChallengePreview({super.key, required this.title, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(right: 7),
      decoration: BoxDecoration(
        border: Border.all(color: dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),
          Text(tag),
        ],
      ),
    );
  }
}
