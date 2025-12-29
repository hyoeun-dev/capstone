import 'package:capstone/colors.dart';
import 'package:capstone/constants.dart';
import 'package:capstone/cubit/social_favorite_cubit.dart';
import 'package:capstone/state/social_favorite_state.dart';
import 'package:capstone/todo_accordion_contents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialFeed extends StatefulWidget {
  final String name;
  final String title;
  final int index;
  final int heartIndex;
  final int days;
  final bool isLastContent;
  const SocialFeed({super.key, required this.name, required this.title, required this.index, required this.isLastContent, required this.heartIndex, required this.days});

  @override
  State<SocialFeed> createState() => _SocialFeedState();
}

class _SocialFeedState extends State<SocialFeed> {

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    DateTime now = DateTime.utc(today.year, today.month, today.day);

    List<String> tags = ['학교', '문화'];
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2, horizontal: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        border: Border.all(color: mediumGreyColor),
        borderRadius: BorderRadius.circular(15),
        color: whiteColor,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  margin: EdgeInsets.only(right: kDefaultPadding),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: blackColor.withAlpha(60),
                  ),
                  child: Icon(CupertinoIcons.person_fill, color: whiteColor),
                ),
                Padding(
                  padding: EdgeInsets.only(right: kDefaultPadding),
                  child: Text(
                    widget.name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(color: mediumGreyColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: tags[widget.index],
                      items: tags.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              value,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {},
                      dropdownColor: whiteColor,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      alignment: Alignment.center,
                      iconSize: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(thickness: 1),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: TodoAccordionContents(
              title: widget.title,
              plannedDateTime: now,
              dueDateTime: now.add(Duration(days: widget.days)),
              isBottomPaddingRequired: false,
            ),
          ),
          Divider(thickness: 1),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                BlocBuilder<SocialFavoriteCubit, SocialFavoriteState>(
                  builder: (context, state) {
                    bool isFavorite = state.currentFavorites[widget.heartIndex] ?? false;

                    return GestureDetector(
                      onTap: () {
                        context.read<SocialFavoriteCubit>().toggleFavorites(widget.heartIndex);
                      },
                      child: (isFavorite == false)
                          ? Icon(CupertinoIcons.heart, size: 25, color: blackColor,)
                          : Icon(CupertinoIcons.heart_fill, size: 25, color: blackColor,),
                    );
                  }
                ),
                Padding(padding: EdgeInsets.only(left: 10), child: Icon(CupertinoIcons.bubble_left, size: 22, color: blackColor,),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
