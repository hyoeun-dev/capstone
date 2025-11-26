import 'dart:async';

import 'package:capstone/accordion/archive_accordion.dart';
import 'package:capstone/breadcrumbs.dart';
import 'package:capstone/colors.dart';
import 'package:capstone/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class ArchiveScreen extends StatefulWidget {
  final String? searchPath;

  const ArchiveScreen({super.key, this.searchPath});

  @override
  State<ArchiveScreen> createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends State<ArchiveScreen> {
  late StreamSubscription _intentSub;
  final _sharedFiles = <SharedMediaFile>[];

  @override
  void initState() {
    super.initState();

    // Listen to media sharing coming from outside the app while the app is in the memory.
    _intentSub = ReceiveSharingIntent.instance.getMediaStream().listen((value) {
      setState(() {
        _sharedFiles.clear();
        _sharedFiles.addAll(value);

        print(_sharedFiles.map((f) => f.toMap()));
      });
    }, onError: (err) {
      print("getIntentDataStream error: $err");
    });

    // Get the media sharing coming from outside the app while the app is closed.
    ReceiveSharingIntent.instance.getInitialMedia().then((value) {
      setState(() {
        _sharedFiles.clear();
        _sharedFiles.addAll(value);
        print(_sharedFiles.map((f) => f.toMap()));

        // Tell the library that we are done processing the intent.
        ReceiveSharingIntent.instance.reset();
      });
    });
  }

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
