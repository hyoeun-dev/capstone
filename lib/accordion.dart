import 'package:capstone/colors.dart';
import 'package:capstone/widget/accordion_categories.dart';
import 'package:capstone/widget/accordion_contents.dart';
import 'package:capstone/widget/accordion_contents_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Accordion extends StatefulWidget {
  const Accordion({super.key});

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AccordionCategories(
          title: '취업',
          contentsList: [
            AccordionContents(
              title: '취업 지원 혜택 모음집',
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (context) {
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
                              '취업 지원 혜택 모음집',
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
                          AccordionContentsHeader(),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text('어떤 식으로 글이 추가되는 걸까요?'),
                                    /// todo 추가 기획 필요
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
                  },
                );
              },
            ),

            AccordionContents(title: '이력서에 넣을 경험 정리', onTap: () {}),
            AccordionContents(title: '포트폴리오 템플릿', onTap: () {}),
          ],
        ),
        AccordionCategories(
          title: '자기관리',
          contentsList: [AccordionContents(title: '읽고 싶은 책 리스트', onTap: () {})],
        ),
        AccordionCategories(
          title: '쇼핑',
          contentsList: [AccordionContents(title: '화장품 정보', onTap: () {})],
        ),
        AccordionCategories(title: '취미', contentsList: []),
      ],
    );
  }
}
