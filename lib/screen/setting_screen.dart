import 'package:capstone/breadcrumbs.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          Breadcrumbs(korean: '설정', english: 'setting')
        ],
      ),),
    );
  }
}
