import 'package:capstone/breadcrumbs.dart';
import 'package:capstone/colors.dart';
import 'package:capstone/constants.dart';
import 'package:capstone/widget/challenge_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SocialChallengeScreen extends StatelessWidget {
  final String waterPath;
  const SocialChallengeScreen({super.key, required this.waterPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align content to the start
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Breadcrumbs(korean: '소셜', english: 'social'),
              ),
              Divider(color: blackColor, thickness: 1),
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
              Divider(color: blackColor, thickness: 1),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding, horizontal: kDefaultPadding),
                child: Text(
                  '참여 중인 챌린지',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding),
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
                      SizedBox(width: kDefaultPadding),
                      ChallengePreview(title: '🩷봉사 일주일 1회', tag: '#봉사'),
                      SizedBox(width: kDefaultPadding),
                      ChallengePreview(title: '💻컴활 자격 취득', tag: '#컴활'),
                      SizedBox(width: kDefaultPadding),
                      ChallengePreview(title: '❤️운동 습관 만들기', tag: '#운동'),
                    ],
                  ),
                ),
              ),
              Divider(color: blackColor, thickness: 1),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding, horizontal: kDefaultPadding),
                child: Text(
                  '핫한 챌린지',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                      padding: EdgeInsets.all(kDefaultPadding),
                      decoration: BoxDecoration(
                        border: Border.all(color: mediumGreyColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('💯', style: TextStyle(fontSize: 20)),
                          SizedBox(width: 5),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '학점 A+ 달성',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                SizedBox(height: 4),
                                Text('#대학 #학점 #공부', style: Theme.of(context).textTheme.bodySmall),
                                SizedBox(height: 4),
                                Text('대학생 모임으로써 매일 공부를 인증하고 공부 팁을 공유합니다.', style: Theme.of(context).textTheme.bodyMedium),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                      padding: EdgeInsets.all(kDefaultPadding),
                      decoration: BoxDecoration(
                        border: Border.all(color: mediumGreyColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('🏃‍♀️', style: TextStyle(fontSize: 20)),
                          SizedBox(width: 5),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '러닝 30분',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                SizedBox(height: 4),
                                Text('#건강 #운동', style: Theme.of(context).textTheme.bodySmall),
                                SizedBox(height: 4),
                                Text('누구나 참여 가능하며 매일 최소 30분 러닝에 임한 사진을 인증해야 합니다.', style: Theme.of(context).textTheme.bodyMedium),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                      padding: EdgeInsets.all(kDefaultPadding),
                      decoration: BoxDecoration(
                        border: Border.all(color: mediumGreyColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('📓', style: TextStyle(fontSize: 20)),
                          SizedBox(width: 5),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '매일 일기 작성',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                SizedBox(height: 4),
                                Text('#일기 #기록 #일상', style: Theme.of(context).textTheme.bodySmall),
                                SizedBox(height: 4),
                                Text('일기를 꾸준히 작성하려는 사람들의 모임입니다. 다이어리를 꾸미는 것도 가능합니다.', style: Theme.of(context).textTheme.bodyMedium),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
