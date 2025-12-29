import 'package:capstone/accordion/todo_contents_text_field.dart';
import 'package:capstone/cubit/sorting_dropdown_cubit.dart';
import 'package:capstone/state/sorting_dropdown_state.dart';
import 'package:capstone/todo_accordion_contents.dart';
import 'package:capstone/utils/date_difference.dart';
import 'package:capstone/utils/date_format.dart';
import 'package:capstone/widget/todo_accordion_categories.dart';
import 'package:capstone/widget/todo_online_lecture_accordion_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoAccordion extends StatefulWidget {
  final bool isNewContent;

  const TodoAccordion({super.key, required this.isNewContent});

  @override
  State<TodoAccordion> createState() => _TodoAccordionState();
}

class _TodoAccordionState extends State<TodoAccordion> {
    @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    DateTime now = DateTime.utc(today.year, today.month, today.day);

    return BlocBuilder<SortingDropdownCubit, SortingDropdownState>(
      builder: (context, state) {
        if (state.selectedSorting == '수행일 순') {
          return Column(
            children: [
              TodoAccordionCategories(
                title: getFullDate(
                  now.add(Duration(days: 3)).month,
                  now.add(Duration(days: 3)).day,
                ),
                contentsList: [
                  TodoOnlineLectureAccordionContent(now: now),
                  TodoAccordionContents(
                    title: '세탁소 방문',
                    plannedDateTime: DateTime(2025, 11, 5),
                    dueDateTime: now.add(Duration(days: 1)),
                    isBottomPaddingRequired: true,
                  ),
                ],
              ),
              TodoAccordionCategories(
                title: getFullDate(
                  now.add(Duration(days: 4)).month,
                  now.add(Duration(days: 4)).day,
                ),
                contentsList: [
                  TodoAccordionContents(
                    title: '학술제 참여',
                    plannedDateTime: DateTime(2025, 11, 6),
                    dueDateTime: now.add(Duration(days: 4)),
                    isBottomPaddingRequired: true,
                  ),
                ],
              ),
              TodoAccordionCategories(
                title: getFullDate(
                  now.add(Duration(days: 5)).month,
                  now.add(Duration(days: 5)).day,
                ),
                contentsList: [],
              ),
              TodoAccordionCategories(
                title: getFullDate(
                  now.add(Duration(days: 8)).month,
                  now.add(Duration(days: 8)).day,
                ),
                contentsList: [
                  ?(widget.isNewContent == true)
                      ? TodoContentsTextField(
                          plannedDateTime: now.add(Duration(days: 8)),
                          isBottomPaddingRequired: true,
                        )
                      : null,
                ],
              ),
            ],
          );
        } else if (state.selectedSorting == '마감일 순') {
          return Column(
            children: [
              TodoAccordionCategories(
                title: 'D${dateDifference(to: now.add(Duration(days: 1)))}',
                contentsList: [
                  TodoOnlineLectureAccordionContent(now: now),
                  TodoAccordionContents(
                    title: '세탁소 방문',
                    plannedDateTime: DateTime(2025, 11, 5),
                    dueDateTime: now.add(Duration(days: 1)),
                    isBottomPaddingRequired: true,
                  ),
                ],
              ),
              TodoAccordionCategories(
                title: 'D${dateDifference(to: now.add(Duration(days: 4)))}',
                contentsList: [
                  TodoAccordionContents(
                    title: '학술제 참여',
                    plannedDateTime: DateTime(2025, 11, 6),
                    dueDateTime: now.add(Duration(days: 4)),
                    isBottomPaddingRequired: true,
                  ),
                ],
              ),
              TodoAccordionCategories(
                title: 'D${dateDifference(to: now.add(Duration(days: 5)))}',
                contentsList: [],
              ),
              TodoAccordionCategories(
                title: 'D${dateDifference(to: now.add(Duration(days: 6)))}',
                contentsList: [],
              ),
              TodoAccordionCategories(
                title: 'D${dateDifference(to: now.add(Duration(days: 10)))}',
                contentsList: [],
              ),
            ],
          );
        } else if (state.selectedSorting == '태그 순') {
          return Column(
            children: [
              TodoAccordionCategories(
                title: '학교',
                contentsList: [
                  TodoOnlineLectureAccordionContent(now: now),
                  TodoAccordionContents(
                    title: '학술제 참여',
                    plannedDateTime: DateTime(2025, 11, 6),
                    dueDateTime: now.add(Duration(days: 4)),
                    isBottomPaddingRequired: true,
                  ),
                ],
              ),
              TodoAccordionCategories(title: '친구', contentsList: []),
              TodoAccordionCategories(title: '알바', contentsList: []),
            ],
          );
        } else {
          /// todo '추가 순'
        }
        return SizedBox();
      },
    );
  }
}
