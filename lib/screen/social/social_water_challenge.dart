import 'package:capstone/colors.dart';
import 'package:capstone/constants.dart';
import 'package:capstone/widget/social_friends_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class SocialWaterChallenge extends StatelessWidget {
  const SocialWaterChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
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
                      border: Border.all(color: blackColor.withAlpha(100)),
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
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text('공개 · 그룹장 곽규빈'),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 12)),
              Text('물 1L를 마시는 챌린지를 진행합니다.\n누구나 참여 가능합니다.'),
              Text(
                '#건강 #습관',
                style: TextStyle(
                  color: ColorPalette.accentColors['blue'],
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                width:
                    MediaQuery.of(context).size.width -
                    kDefaultHorizontalPadding,
                decoration: BoxDecoration(
                  border: Border.all(color: dividerColor),
                ),
                margin: EdgeInsets.symmetric(vertical: 8),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('조건', style: TextStyle(fontWeight: FontWeight.w700)),
                    Text(
                      '1. 인증: 텀플러 before & after 사진 게시\n2. 상품: 모든 멤버가 90% 인증 달성 시 지급\n3. 기간: 2025년 12월 1일 ~ 2025년 12월 31일',
                    ),
                  ],
                ),
              ),
              Text('참여자', style: TextStyle(fontWeight: FontWeight.w700)),
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
                width:
                    MediaQuery.of(context).size.width -
                    kDefaultHorizontalPadding,
                decoration: BoxDecoration(color: dividerColor),
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 12),
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text('인증하기', style: TextStyle(fontSize: 22)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width:
                        (MediaQuery.of(context).size.width -
                            kDefaultHorizontalPadding * 5) /
                        2,
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide()),
                    ),
                    alignment: Alignment.center,
                    child: Text('나의 인증 현황', style: TextStyle(fontSize: 20)),
                  ),
                  Padding(padding: EdgeInsets.only(left: 20)),
                  Container(
                    width:
                        (MediaQuery.of(context).size.width -
                            kDefaultHorizontalPadding * 5) /
                        2,
                    alignment: Alignment.center,
                    child: Text('그룹 인증 현황', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '85%',
                    style: TextStyle(
                      color: Colors.red.shade900,
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    ),
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
                          border: Border.all(color: dividerColor),
                        ),
                        child: (index == 6) ? null : Icon(CupertinoIcons.checkmark),
                      ),
                      Text(weekdays[index]),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
