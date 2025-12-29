import 'package:capstone/breadcrumbs.dart';
import 'package:capstone/colors.dart';
import 'package:capstone/widget/social_feed.dart';
import 'package:capstone/widget/social_friends_list.dart';
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
      body: SafeArea(child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Align(alignment: Alignment.centerLeft, child: Breadcrumbs(korean: '소셜', english: 'social')),
            Divider(color: blackColor, thickness: 1), // Divider
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...List.generate(5, (index) {
                    return SocialFriendsList(name: nameList[index]);
                  }),
                  Column(
                    children: [
                      Icon(Icons.arrow_forward), // Replaced Cupertino icon
                      Padding(padding: EdgeInsets.only(bottom: 3)),
                      Text('더보기')
                    ],
                  ),
                ],
              ),
            ),
            Divider(color: blackColor, thickness: 1), // Divider
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
        child: Icon(Icons.military_tech, color: blackColor), // Replaced Cupertino icon and set color
      ),
    );
  }
}
