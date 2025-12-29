import 'package:capstone/colors.dart';
import 'package:capstone/constants.dart';
import 'package:capstone/utils/date_difference.dart';
import 'package:capstone/utils/date_format.dart';
import 'package:flutter/material.dart';

class TodoAccordionContents extends StatefulWidget {
  final String title;
  final DateTime plannedDateTime;
  final DateTime dueDateTime;
  final bool isBottomPaddingRequired;

  const TodoAccordionContents({
    super.key,
    required this.title,
    required this.plannedDateTime,
    required this.dueDateTime,
    required this.isBottomPaddingRequired
  });

  @override
  State<TodoAccordionContents> createState() => _TodoAccordionContentsState();
}

class _TodoAccordionContentsState extends State<TodoAccordionContents> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding( // Use Padding here for overall spacing
      padding: EdgeInsets.only(
        left: kDefaultPadding,
        right: kDefaultPadding,
        bottom: widget.isBottomPaddingRequired ? kDefaultPadding : 0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // Align items centrally
        children: [
          SizedBox(
            width: 24, // Standard checkbox size
            height: 24,
            child: Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero), // Sharp corners
              side: BorderSide(width: 1, color: blackColor), // Solid black border
              checkColor: whiteColor,
              activeColor: blackColor,
            ),
          ),
          SizedBox(width: kDefaultPadding), // Spacing between checkbox and text
          Expanded( // Let content take available space
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        widget.title,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: blackColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      'D${dateDifference(to: widget.dueDateTime)}',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: blackColor),
                    ),
                  ],
                ),
                SizedBox(height: 4), // Small spacing between title and dates
                Text(
                  '수행일 ${getShortDate(widget.plannedDateTime.month,widget.plannedDateTime.day)} | 마감일 ${getShortDate(widget.dueDateTime.month,widget.dueDateTime.day)}',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: blackColor.withAlpha(179)), // Lighter color for dates
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
