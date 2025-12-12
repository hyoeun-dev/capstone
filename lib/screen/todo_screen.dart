import 'package:capstone/accordion/todo_accordion.dart';
import 'package:capstone/breadcrumbs.dart';
import 'package:capstone/colors.dart';
import 'package:capstone/constants.dart';
import 'package:capstone/widget/todo_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  final String? searchPath;

  const TodoScreen({super.key, this.searchPath});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  bool isNewContent = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: whiteColor,
        body: SafeArea(
          child: Column(
            children: [
              Align(alignment: Alignment.centerLeft, child: Breadcrumbs(korean: '실행', english: 'todo')),
              TodoHeader(),
              Padding(
                padding: EdgeInsets.all(kDefaultPadding),
                child: TodoAccordion(isNewContent: isNewContent,),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              isNewContent = !isNewContent;
            });
          },
          isExtended: true,
          backgroundColor: ColorPalette.accentColors['light beige'],
          shape: CircleBorder(),
          child: Icon(CupertinoIcons.plus, color: blackColor,),
        ),
      ),
    );
  }
}
