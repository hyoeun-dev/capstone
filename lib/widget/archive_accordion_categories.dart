import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArchiveAccordionCategories extends StatefulWidget {
  final String title;
  final List<Widget> contentsList;
  const ArchiveAccordionCategories({super.key, required this.title, required this.contentsList});

  @override
  State<ArchiveAccordionCategories> createState() => _ArchiveAccordionCategoriesState();
}

class _ArchiveAccordionCategoriesState extends State<ArchiveAccordionCategories> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.all(0),
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
