import 'package:capstone/colors.dart';
import 'package:capstone/constants.dart';
import 'package:capstone/widget/social_friends_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SocialWaterChallenge extends StatelessWidget {
  const SocialWaterChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( // Added SingleChildScrollView to prevent overflow
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultHorizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(CupertinoIcons.arrow_left, size: 20),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 12)),
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: mediumGreyColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: Text('💧', style: TextStyle(fontSize: 30)),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '물 1L 마시기',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            '공개 · 그룹장 곽규빈',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 12)),
                Text('물 1L를 마시는 챌린지를 진행합니다.\n누구나 참여 가능합니다.', style: Theme.of(context).textTheme.bodyMedium),
                Padding(padding: EdgeInsets.only(bottom: 8)),
                Text(
                  '#건강 #습관',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold, color: ColorPalette.accentColors['blue']),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: mediumGreyColor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('조건', style: Theme.of(context).textTheme.titleSmall),
                      SizedBox(height: 4),
                      Text(
                        '1. 인증: 텀플러 before & after 사진 게시\n2. 상품: 모든 멤버가 90% 인증 달성 시 지급\n3. 기간: 2025년 12월 1일 ~ 2025년 12월 31일',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Text('참여자', style: Theme.of(context).textTheme.titleSmall),
                Padding(padding: EdgeInsets.only(bottom: 12)),
                SizedBox(
                  width: 180,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SocialFriendsList(name: '곽규빈'),
                      SocialFriendsList(name: '이수빈'),
                      SocialFriendsList(name: '이효은'),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorPalette.accentColors['light beige'],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 12),
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text('인증하기', style: Theme.of(context).textTheme.titleMedium),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: mediumGreyColor, width: 2)),
                      ),
                      alignment: Alignment.center,
                      child: Text('나의 인증 현황', style: Theme.of(context).textTheme.bodyLarge),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text('그룹 인증 현황', style: Theme.of(context).textTheme.bodyLarge),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '85%',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w900, fontSize: 30, fontFamily: 'BookkGothic',),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(7, (index) {
                    List<String> weekdays = ['일', '월', '화', '수', '목', '금', '토'];
                    return Column(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                          decoration: BoxDecoration(
                            border: Border.all(color: mediumGreyColor),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: (index == 6) ? null : Icon(CupertinoIcons.checkmark),
                        ),
                        Text(weekdays[index], style: Theme.of(context).textTheme.bodySmall),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
