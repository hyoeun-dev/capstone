import 'package:capstone/accordion/archive_accordion.dart';
import 'package:capstone/breadcrumbs.dart';
import 'package:capstone/colors.dart';
import 'package:capstone/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ArchiveScreen extends StatelessWidget {
  final String? searchPath;

  const ArchiveScreen({super.key, this.searchPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            Align(alignment: Alignment.centerLeft, child: Breadcrumbs(korean: '보관소', english: 'archive',)),
            GestureDetector(
              onTap: () => context.go('/archive/search'),
              child: AbsorbPointer(child: SizedBox(
                width: MediaQuery.of(context).size.width - kDefaultHorizontalPadding,
                  child: CupertinoSearchTextField(
                    placeholder: '검색',
                  ))),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(kDefaultPadding),
              child: ArchiveAccordion(),
              /// todo 아코디언 컴포넌트 넣기
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// todo 할 일 추가하는 버튼
        },
        isExtended: true,
        backgroundColor: ColorPalette.accentColors['light beige'],
        shape: CircleBorder(),
        child: Icon(CupertinoIcons.plus, color: blackColor,),
      ),
    );
  }
}
