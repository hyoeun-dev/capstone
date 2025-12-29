import 'package:capstone/colors.dart';
import 'package:capstone/todo_accordion_contents.dart';
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
            // Rely on global dialogTheme
            title: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back, // Replaced icon
                    size: 24,
                    color: blackColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    '도서관 책 반납',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: RichText(text: TextSpan(children: [
                            TextSpan(text: '· 객체지향 UI 디자인 반납\n\n', style: Theme.of(context).textTheme.bodyMedium),
                            TextSpan(text: '· 파이썬 첫걸음 반납', style: Theme.of(context).textTheme.bodyMedium),
                          ])),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: FloatingActionButton(
                            onPressed: () {
                              /// todo 공유 바텀시트 띄우기
                            },
                            // Rely on global floatingActionButtonTheme
                            child: Icon(Icons.share, color: blackColor), // Replaced icon
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
        title: '도서관 책 반납',
        plannedDateTime: DateTime(2025, 11, 5),
        dueDateTime: now.add(Duration(days: 1)),
        isBottomPaddingRequired: true,
      ),
    );
  }
}

