import 'package:capstone/colors.dart';
import 'package:capstone/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoAccordionCategories extends StatefulWidget {
  final String title;
  final List<Widget> contentsList;
  const TodoAccordionCategories({super.key, required this.title, required this.contentsList});

  @override
  State<TodoAccordionCategories> createState() => _TodoAccordionCategoriesState();
}

class _TodoAccordionCategoriesState extends State<TodoAccordionCategories> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      decoration: BoxDecoration(
        border: Border.all(color: mediumGreyColor),
        borderRadius: BorderRadius.circular(15),
        color: whiteColor,
      ),
      child: ClipRRect( // Added ClipRRect
        borderRadius: BorderRadius.circular(15),
        child: ExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          backgroundColor: whiteColor,
          collapsedBackgroundColor: whiteColor,
          shape: Border.fromBorderSide(BorderSide.none),
          trailing: Icon(
            _customTileExpanded
                ? CupertinoIcons.chevron_up
                : CupertinoIcons.chevron_down,
            size: 20,
            color: blackColor,
          ),
          children: widget.contentsList,
          onExpansionChanged: (bool expanded) {
            setState(() {
              _customTileExpanded = expanded;
            });
          },
        ),
      ),
    );
  }
}
