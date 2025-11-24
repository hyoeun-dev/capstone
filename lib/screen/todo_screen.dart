import 'package:capstone/breadcrumbs.dart';
import 'package:capstone/colors.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatelessWidget {
  final String? searchPath;
  const TodoScreen({super.key, this.searchPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(child: Column(
        children: [
          Breadcrumbs(korean: '실행', english: 'todo'),
        ],
      )),
    );
  }
}
