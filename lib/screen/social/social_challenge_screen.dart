import 'package:capstone/breadcrumbs.dart';
import 'package:capstone/colors.dart';
import 'package:capstone/constants.dart';
import 'package:capstone/screen/social/social_water_challenge.dart';
import 'package:capstone/widget/challenge_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SocialChallengeScreen extends StatelessWidget {
  String waterPath;
  SocialChallengeScreen({super.key, required this.waterPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Breadcrumbs(korean: '소셜', english: 'social'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: CupertinoSearchTextField(enabled: false),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
              padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
              width:
                  MediaQuery.of(context).size.width - kDefaultHorizontalPadding,
              decoration: BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(color: dividerColor),
                ),
              ),
              child: Text(
                '참여 중인 챌린지',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.go('/social/challenge/water'),
                      child: ChallengePreview(
                        title: '💧물 1L 마시기',
                        tag: '#건강 #습관',
                      ),
                    ),
                    ChallengePreview(title: '🩷봉사 일주일 1회', tag: '#봉사'),
                    ChallengePreview(title: '💻컴활 자격 취득', tag: '#컴활'),
                    ChallengePreview(title: '❤️운동 습관 만들기', tag: '#운동'),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
              padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
              width:
                  MediaQuery.of(context).size.width - kDefaultHorizontalPadding,
              decoration: BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(color: dividerColor),
                ),
              ),
              child: Text(
                '핫한 챌린지',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ),
            IntrinsicWidth(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: dividerColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('💯', style: TextStyle(fontSize: 20)),
                    Padding(padding: EdgeInsets.only(right: 5)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '학점 A+ 달성',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        Text('#대학 #학점 #공부'),
                        Text('대학생 모임으로써 매일 공부를 인증하고 공부 팁을\n공유합니다.'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            IntrinsicWidth(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: dividerColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('🏃‍♀️', style: TextStyle(fontSize: 20)),
                    Padding(padding: EdgeInsets.only(right: 5)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '러닝 30분',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        Text('#건강 #운동'),
                        Text('누구나 참여 가능하며 매일 최소 30분 러닝에 임한\n사진을 인증해야 합니다.'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            IntrinsicWidth(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: dividerColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('📓', style: TextStyle(fontSize: 20)),
                    Padding(padding: EdgeInsets.only(right: 5)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '매일 일기 작성',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        Text('#일기 #기록 #일상'),
                        Text(
                          '일기를 꾸준히 작성하려는 사람들의 모임입니다.   \n다이어리를 꾸미는 것도 가능합니다.',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
