import 'package:capstone/breadcrumbs.dart';
import 'package:flutter/material.dart';

class SocialScreen extends StatelessWidget {
  final String? searchPath;
  final String? challengePath;
  const SocialScreen({super.key, this.searchPath, this.challengePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(child: Column(
        children: [
          Breadcrumbs(korean: '소셜', english: 'social'),
        ],
      )),
    );
  }
}
