import 'package:capstone/colors.dart';
import 'package:capstone/cubit/accordion_choice_chip.dart';
import 'package:capstone/cubit/accordion_favorites_cubit.dart';
import 'package:capstone/cubit/tag_dropdown_cubit.dart';
import 'package:capstone/state/accordion_favorites_state.dart';
import 'package:capstone/state/tag_dropdown_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccordionContentsHeader extends StatelessWidget {
  const AccordionContentsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> formOptions = ['사진', '글', '링크'];

    return SizedBox(
      height: 25,
      child: Row(
        children: [
          BlocBuilder<TagDropdownCubit, TagDropdownState>(
            builder: (context, state) {
              return Container(
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(border: Border.all()),
                child: DropdownButton(
                  value: context.watch<TagDropdownCubit>().state.selectedTag,
                  items: state.tags.map((String value) {
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
                  onChanged: (String? value) {
                    context.read<TagDropdownCubit>().selectTag(value);
                  },
                  hint: Text('태그'),
                  dropdownColor: whiteColor,
                 padding: EdgeInsets.symmetric(horizontal: 8),
                  alignment: Alignment.center,
                  iconSize: 0,

                ),
              );
            },
          ),
          BlocBuilder<AccordionFavoritesCubit, AccordionFavoritesState>(
            builder: (context, state) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(border: Border.symmetric(vertical: BorderSide())),
                child: GestureDetector(
                  onTap: () {
                    context.read<AccordionFavoritesCubit>().toggleFavorites();
                  },
                  child: state.isFavorites
                      ? Icon(
                          CupertinoIcons.star_fill,
                          size: 20,
                          color: blackColor,
                        )
                      : Icon(CupertinoIcons.star, size: 20, color: blackColor),
                ),
              );
            },
          ),
          BlocBuilder<AccordionChoiceChip, String?>(
            builder: (context, selectedValue) {
              return Padding(
                padding: EdgeInsets.only(left: 8),
                child: Wrap(
                  spacing: -5,
                  children: formOptions.map((String itemValue) {
                    return SizedBox(
                      height: 25,
                      child: ChoiceChip(
                        label: Container(
                          alignment: Alignment(0, -0.5),
                          child: Text(itemValue),
                        ),
                        padding: EdgeInsets.zero,
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        labelPadding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 0,
                        ),
                        selectedColor: ColorPalette.accentColors['yellow'],
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: blackColor),
                        ),
                        backgroundColor: whiteColor,
                        shadowColor: Colors.transparent,
                        showCheckmark: false,
                        selected: selectedValue == itemValue,
                        onSelected: (bool isSelected) {
                          context.read<AccordionChoiceChip>().selectItem(
                            itemValue,
                          );
                        },
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
