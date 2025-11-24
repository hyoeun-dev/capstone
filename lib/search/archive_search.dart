import 'package:capstone/breadcrumbs.dart';
import 'package:capstone/colors.dart';
import 'package:capstone/constants.dart';
import 'package:capstone/widget/archive_search_choices.dart';
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
  String? isSelectedFavorites;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Breadcrumbs(korean: '보관소', english: 'archive'),
            ),
            Center(
              child: SizedBox(
                width:
                    MediaQuery.of(context).size.width -
                    kDefaultHorizontalPadding,
                child: CupertinoSearchTextField(
                  placeholder: '검색',
                  onSubmitted: (value) {
                    /// todo 보관소 검색 결과 보여주는 페이지로 이동
                  },
                ),
              ),
            ),
            ArchiveSearchChoices(category: '태그', optionList: tagOptions, selectedValue: selectedTag, isFavorites: false,),
            ArchiveSearchChoices(category: '형식', optionList: formOptions, selectedValue: selectedForm, isFavorites: false,),
            ArchiveSearchChoices(category: '', optionList: ['즐겨찾기'], selectedValue: isSelectedFavorites, isFavorites: true,),
            /*
            Container(
              margin: EdgeInsets.only(left: 8, right: 8, top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Text('태그', style: TextStyle(color: blackColor, fontSize: 18),),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        border: Border(left: BorderSide()),
                      ),
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: tagOptions.map((String itemValue) {
                          return UnconstrainedBox(
                            child: SizedBox(
                              height: 25,
                              child: ChoiceChip(
                                label: Align(
                                  alignment: Alignment(0, -0.5),
                                  child: Text(itemValue, style: TextStyle(
                                    fontSize: 16
                                  ),),
                                ),
                                padding: EdgeInsets.zero,
                                labelPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                                selectedColor: ColorPalette.accentColors['yellow'],
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: blackColor),
                                ),
                                backgroundColor: whiteColor,
                                shadowColor: Colors.transparent,
                                showCheckmark: false,
                                selected: selectedTag == itemValue,
                                onSelected: (_) {
                                  if(selectedTag == itemValue) {
                                    setState(() {
                                      selectedTag = null;
                                    });
                                  } else {
                                    setState(() {
                                      selectedTag = itemValue;
                                    });
                                  }
                                },
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  )
                ],
              ),
            ),
            */
          ],
        ),
      ),
    );
  }
}
