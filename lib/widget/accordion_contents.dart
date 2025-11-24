import 'package:capstone/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccordionContents extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  const AccordionContents({super.key, required this.title, required this.onTap});

  @override
  State<AccordionContents> createState() => _AccordionContentsState();
}

class _AccordionContentsState extends State<AccordionContents> {
  bool _isFavorites = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      /// todo 상세 모달 띄우기
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.title),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isFavorites = !_isFavorites;
                });
              },
              child: _isFavorites ? Icon(CupertinoIcons.star_fill, size: 20,) : Icon(CupertinoIcons.star, size: 20,),
            ),
          ],
        ),
      ),
    );
  }
}
