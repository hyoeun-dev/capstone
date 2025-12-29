import 'package:capstone/breadcrumbs.dart';
import 'package:capstone/colors.dart';
import 'package:capstone/constants.dart';
import 'package:capstone/search/archive_search_choices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArchiveSearch extends StatefulWidget {
  const ArchiveSearch({super.key});

  @override
  State<ArchiveSearch> createState() => _ArchiveSearchState();
}

class _ArchiveSearchState extends State<ArchiveSearch> {
  String? selectedTag;
  List<String> tagOptions = ['취업', '자기관리', '쇼핑', '취미'];
  String? selectedForm;
  List<String> formOptions = ['전체', '사진', '글', '링크'];
  String? isSelectedFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Breadcrumbs(korean: '보관소', english: 'archive'),
            ),
            Divider(thickness: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding),
              child: CupertinoSearchTextField(
                placeholder: '검색',
                onSubmitted: (value) {
                  /// todo 보관소 검색 결과 보여주는 페이지로 이동
                },
                decoration: BoxDecoration(
                  border: Border.all(color: mediumGreyColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                placeholderStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: blackColor.withAlpha(128), fontSize: 13, height: 1),
              ),
            ),
            Divider(thickness: 1),
            ArchiveSearchChoices(category: '태그', optionList: tagOptions, selectedValue: selectedTag, isFavorite: false,),
            Divider(thickness: 1),
            ArchiveSearchChoices(category: '형식', optionList: formOptions, selectedValue: selectedForm, isFavorite: false,),
            Divider(thickness: 1),
            ArchiveSearchChoices(category: '', optionList: ['즐겨찾기'], selectedValue: isSelectedFavorite, isFavorite: true,),
          ],
        ),
      ),
    );
  }
}
