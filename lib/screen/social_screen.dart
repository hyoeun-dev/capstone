import 'package:capstone/breadcrumbs.dart';
import 'package:capstone/colors.dart';
import 'package:capstone/screen/social/social_challenge_screen.dart';
import 'package:capstone/widget/social_feed.dart';
import 'package:capstone/widget/social_friends_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SocialScreen extends StatelessWidget {
  final String? searchPath;
  final String? challengePath;
  const SocialScreen({super.key, this.searchPath, this.challengePath});

  @override
  Widget build(BuildContext context) {
    List<String> nameList = ['곽규빈', '이효은', '이수빈', '홍길동', '김철수'];

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Align(alignment: Alignment.centerLeft, child: Breadcrumbs(korean: '소셜', english: 'social')),
            Padding(padding: EdgeInsets.only(top: 3)),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: dividerColor)),
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    spacing: 20,
                    children: List.generate(5, (index) {
                      return SocialFriendsList(name: nameList[index]);
                    },),
                  ),
                  Column(
                    children: [
                      Icon(CupertinoIcons.arrow_right),
                      Padding(padding: EdgeInsets.only(bottom: 3)),
                      Text('더보기')
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SocialFeed(name: nameList[0], title: '정보서비스기획 과제', index: 0, isLastContent: false, heartIndex: 0, days: 10,),
                SocialFeed(name: nameList[1], title: '화요일 수업 예습', index: 1, isLastContent: false, heartIndex: 1, days: 2,),
                SocialFeed(name: nameList[2], title: '홍길동과의 약속', index: 0, isLastContent: false, heartIndex: 2, days: 1,),
                SocialFeed(name: nameList[3], title: '맛집 정보 찾기', index: 0, isLastContent: false, heartIndex: 3, days: 4,),
                SocialFeed(name: nameList[4], title: '강릉 여행', index: 1, isLastContent: true, heartIndex: 4, days: 20,),
              ],
            ),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/social/challenge'),
        isExtended: true,
        backgroundColor: ColorPalette.accentColors['light beige'],
        shape: CircleBorder(),
        child: Icon(CupertinoIcons.rosette, color: blackColor,),
      ),
    );
  }
}
