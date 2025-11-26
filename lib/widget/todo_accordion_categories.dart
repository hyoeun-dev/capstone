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
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      title: Text(widget.title),
      shape: Border.fromBorderSide(BorderSide.none),
      /// todo trailing 없앨 경우 애니메이션 자동 적용됨 아이콘 사이즈 키울 필요 있음
      trailing: Icon(
        _customTileExpanded
            ? CupertinoIcons.chevron_up
            : CupertinoIcons.chevron_down,
        size: 20,
      ),
      children: widget.contentsList,
      onExpansionChanged: (bool expanded) {
        setState(() {
          _customTileExpanded = expanded;
        });
      },
    );
  }
}
