import 'package:capstone/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CapstoneBottomNavigationBar extends StatelessWidget {
  final StatefulNavigationShell? navigationShell;
  final int index;
  final void Function(int)? onDestinationSelected;

  const CapstoneBottomNavigationBar({
    super.key,
    required this.navigationShell,
    required this.index,
    this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(width: 1, color: dividerColor)),
        ),
        child: NavigationBar(
          /// todo navigation bar height
          onDestinationSelected: onDestinationSelected,
          selectedIndex: index,
          backgroundColor: whiteColor,
          overlayColor: WidgetStatePropertyAll(Colors.transparent),
          indicatorColor: Colors.transparent,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          labelTextStyle: WidgetStatePropertyAll(TextStyle(
            fontSize: 12,
          )),
          labelPadding: EdgeInsets.only(top: 1),

          destinations: [
            NavigationDestination(
              icon: Icon(CupertinoIcons.bolt),
              selectedIcon: Icon(CupertinoIcons.bolt_fill, size: 20,),
              label: '실행',
            ),
            NavigationDestination(
              icon: Icon(CupertinoIcons.doc_text),
              selectedIcon: Icon(CupertinoIcons.doc_text_fill),
              label: '계획',
            ),
            NavigationDestination(
              icon: Icon(CupertinoIcons.archivebox),
              selectedIcon: Icon(CupertinoIcons.archivebox_fill,),
              label: '보관소',
            ),
            NavigationDestination(
              icon: Icon(CupertinoIcons.person_2),
              selectedIcon: Icon(CupertinoIcons.person_2_fill,),
              label: '소셜',
            ),
            NavigationDestination(
              icon: Icon(CupertinoIcons.gear),
              selectedIcon: Icon(CupertinoIcons.gear_solid,),
              label: '설정',
            ),
          ],
        ),
      ),
    );
  }
}