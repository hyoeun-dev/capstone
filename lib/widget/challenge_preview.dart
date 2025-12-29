import 'package:capstone/colors.dart';
import 'package:flutter/material.dart';

class ChallengePreview extends StatelessWidget {
  final String title;
  final String tag;
  const ChallengePreview({super.key, required this.title, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: mediumGreyColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleSmall),
          SizedBox(height: 4),
          Text(tag, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
