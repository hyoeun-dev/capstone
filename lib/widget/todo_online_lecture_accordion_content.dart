import 'package:capstone/colors.dart';
import 'package:capstone/todo_accordion_contents.dart';
import 'package:capstone/widget/accordion_contents_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoOnlineLectureAccordionContent extends StatelessWidget {
  final DateTime now;
  const TodoOnlineLectureAccordionContent({super.key, required this.now});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showDialog(context: context, builder: (context) {
          return AlertDialog(
            backgroundColor: whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.zero,
            ),
            title: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    CupertinoIcons.arrow_left,
                    size: 20,
                    color: blackColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    '온라인 강의 듣기',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: blackColor,
                    ),
                  ),
                ),
              ],
            ),
            content: Column(
              children: [
                /// todo header 필요
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: RichText(text: TextSpan(children: [
                            TextSpan(text: '· 강의만 다운받기\n\n', style: TextStyle(
                              color: blackColor,
                              fontSize: 16,
                            )),
                            TextSpan(text: '· 강의 링크: https://', style: TextStyle(
                              color: blackColor,
                              fontSize: 16,
                            )),
                          ])),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: FloatingActionButton(
                            onPressed: () {
                              /// todo 공유 바텀시트 띄우기
                            },
                            isExtended: true,
                            shape: CircleBorder(),
                            backgroundColor: ColorPalette.accentColors['light beige'],
                            child: Icon(CupertinoIcons.person_2_fill, color: blackColor,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },);
      },
      child: TodoAccordionContents(
        title: '온라인 강의 듣기',
        plannedDateTime: DateTime(2025, 11, 5),
        dueDateTime: now.add(Duration(days: 1)),
        isBottomPaddingRequired: true,
      ),
    );
  }
}

