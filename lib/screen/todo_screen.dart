import 'package:capstone/accordion/todo_accordion.dart';
import 'package:capstone/breadcrumbs.dart';
import 'package:capstone/colors.dart';
import 'package:capstone/constants.dart';
import 'package:capstone/widget/todo_header.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatelessWidget {
  final String? searchPath;

  const TodoScreen({super.key, this.searchPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            Align(alignment: Alignment.centerLeft, child: Breadcrumbs(korean: '실행', english: 'todo')),
            TodoHeader(),
            Padding(
              padding: EdgeInsets.all(kDefaultPadding),
              child: TodoAccordion(),
            ),
          ],
        ),
      ),
    );
  }
}
