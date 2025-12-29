import 'package:capstone/colors.dart';
import 'package:capstone/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Breadcrumbs extends StatelessWidget {
  final String korean;
  final String? english;
  const Breadcrumbs({super.key, required this.korean, required this.english});

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouter.of(
      context,
    ).routerDelegate.currentConfiguration.fullPath;
    final segments = currentLocation
        .split('/')
        .where((s) => s.isNotEmpty)
        .toList();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: -1,
        children: [
          if (segments.isNotEmpty && segments.first == english) ...[
            InkWell(
              onTap: () => context.go('/$english'),
              overlayColor: WidgetStatePropertyAll(Colors.transparent),
              child: Text(korean, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: blackColor)),
            ),
          ],
          for (int i = 1; i < segments.length; i++) ...[
            const Text(' > '),
            InkWell(
              onTap: () {
                final path = '/${segments.sublist(0, i + 1).join('/')}';
                context.go(path);
              },
              overlayColor: WidgetStatePropertyAll(Colors.transparent),
              child: Text(
                segmentsNames[segments[i].toLowerCase()]!,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: blackColor),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() => '${this[0].toUpperCase()}${substring(1)}';
}
