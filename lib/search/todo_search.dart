import 'package:capstone/breadcrumbs.dart';
import 'package:capstone/colors.dart';
import 'package:capstone/constants.dart';
import 'package:capstone/search/todo_search_choices.dart';
import 'package:capstone/search/todo_search_period.dart';
import 'package:capstone/widget/todo_accordion_categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoSearch extends StatefulWidget {
  const TodoSearch({super.key});

  @override
  State<TodoSearch> createState() => _TodoSearchState();
}

class _TodoSearchState extends State<TodoSearch> {
  String? selectedTag;
  List<String> tagOptions = ['취업', '자기관리', '쇼핑', '취미'];
  String? selectedForm;
  List<String> formOptions = ['전체', '사진', '글', '링크'];
  String? selectedStartDate;
  String? selectedFinalDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Breadcrumbs(korean: '실행', english: 'todo'),
            ),
            Center(
              child: SizedBox(
                width:
                    MediaQuery.of(context).size.width -
                    kDefaultHorizontalPadding,
                child: CupertinoSearchTextField(
                  placeholder: '검색',
                  onSubmitted: (value) {
                    /// todo 실행 검색 결과 보여주는 페이지로 이동
                  },
                ),
              ),
            ),
            TodoSearchChoices(
              category: '태그',
              optionList: tagOptions,
              selectedValue: selectedTag,
            ),
            TodoSearchChoices(
              category: '형식',
              optionList: formOptions,
              selectedValue: selectedForm,
            ),
            TodoSearchPeriod(category: '기간'),
          ],
        ),
      ),
    );
  }
}
