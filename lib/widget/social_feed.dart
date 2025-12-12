import 'package:capstone/colors.dart';
import 'package:capstone/constants.dart';
import 'package:capstone/cubit/social_favorite_cubit.dart';
import 'package:capstone/state/social_favorite_state.dart';
import 'package:capstone/todo_accordion_contents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialFeed extends StatefulWidget {
  String name;
  String title;
  int index;
  int heartIndex;
  int days;
  bool isLastContent;
  SocialFeed({super.key, required this.name, required this.title, required this.index, required this.isLastContent, required this.heartIndex, required this.days});

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
      margin: EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        border: (widget.isLastContent == false) ? Border(bottom: BorderSide(color: dividerColor)): Border.fromBorderSide(BorderSide.none)
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: blackColor.withAlpha(60),
                ),
                child: Icon(CupertinoIcons.person_fill),
              ),
              Padding(
                padding: EdgeInsets.only(right: kDefaultPadding),
                child: Text(
                  widget.name,
                  style: TextStyle(color: blackColor, fontSize: 15),
                ),
              ),
              Container(
                height: 25,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(border: Border.all()),
                child: DropdownButton(
                  value: tags[widget.index],
                  items: tags.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          value,
                          style: TextStyle(color: blackColor, fontSize: 15),
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
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: TodoAccordionContents(
              title: widget.title,
              plannedDateTime: now,
              dueDateTime: now.add(Duration(days: widget.days)),
              isBottomPaddingRequired: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                BlocBuilder<SocialFavoriteCubit, SocialFavoriteState>(
                  builder: (context, state) {
                    bool isFavorite = state.currentFavorites[widget.heartIndex] ?? false;

                    return Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: GestureDetector(
                        onTap: () {
                          context.read<SocialFavoriteCubit>().toggleFavorites(widget.heartIndex);
                        },
                        child: (isFavorite == false)
                            ? Icon(CupertinoIcons.heart, size: 25,)
                            : Icon(CupertinoIcons.heart_fill, size: 25,),
                      ),
                    );
                  }
                ),
                Padding(padding: EdgeInsets.only(left: 10), child: Icon(CupertinoIcons.bubble_left, size: 22,),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
