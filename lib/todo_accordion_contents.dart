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
    return Column(
      children: [
        Container(
          margin: (widget.isBottomPaddingRequired) ? EdgeInsets.only(bottom: kDefaultPadding) : EdgeInsets.zero,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 20,
                  height: 30,
                  margin: EdgeInsets.only(left: kDefaultPadding),
                  child: Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    side: BorderSide(width: 1.2),
                    checkColor: whiteColor,
                    activeColor: blackColor,
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - kDefaultHorizontalPadding * 3 - 20,
                    height: 25,
                    margin: EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.title, style: TextStyle(fontSize: 18),),
                        Text('D${dateDifference(to: widget.dueDateTime)}', style: TextStyle(fontSize: 18),),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - kDefaultHorizontalPadding * 3 - 20,
                    height: 25,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '수행일 ${getShortDate(widget.plannedDateTime.month,widget.plannedDateTime.day)} | 마감일 ${getShortDate(widget.dueDateTime.month,widget.dueDateTime.day)}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
