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
  final _sharedFiles = <SharedMediaFile>[];

  @override
  void initState() {
    super.initState();

    // Listen to media sharing coming from outside the app while the app is in the memory.
    ReceiveSharingIntent.instance.getMediaStream().listen((value) {
      setState(() {
        _sharedFiles.clear();
        _sharedFiles.addAll(value);
      });
    }, onError: (err) {
      // Handle error
    });

    // Get the media sharing coming from outside the app while the app is closed.
    ReceiveSharingIntent.instance.getInitialMedia().then((value) {
      setState(() {
        _sharedFiles.clear();
        _sharedFiles.addAll(value);

        // Tell the library that we are done processing the intent.
        ReceiveSharingIntent.instance.reset();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(alignment: Alignment.centerLeft, child: Breadcrumbs(korean: '보관소', english: 'archive',)),
            Divider(color: dividerColor, thickness: 1), // Divider
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: GestureDetector(
                onTap: () => context.go('/archive/search'),
                child: AbsorbPointer(
                  child: SizedBox(
                    height: 35,
                    child: CupertinoSearchTextField(
                      placeholder: '검색',
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: mediumGreyColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      placeholderStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: blackColor.withAlpha(128), height: 1, fontSize: 13), // Adjusted size
                    ),
                  ),
                ),
              ),
            ),
            Divider(color: dividerColor, thickness: 1), // Divider
            Expanded( // To make the accordion fill the remaining space
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ArchiveAccordion(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// todo 할 일 추가하는 버튼
        },
        child: Icon(Icons.add, color: blackColor), // Replaced Cupertino icon and set color
      ),
    );
  }
}
