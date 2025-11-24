import 'package:capstone/breadcrumbs.dart';
import 'package:flutter/material.dart';

class PlanScreen extends StatelessWidget {
  final String? searchPath;
  const PlanScreen({super.key, this.searchPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          Breadcrumbs(korean: '계획', english: 'plan'),
        ],
      )),
    );
  }
}
