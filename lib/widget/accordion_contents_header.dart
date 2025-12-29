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
      height: 35, // Increased height for consistency
      child: Row(
        children: [
          BlocBuilder<TagDropdownCubit, TagDropdownState>(
            builder: (context, state) {
              return Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: dividerColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: context.watch<TagDropdownCubit>().state.selectedTag,
                    items: state.tags.map((String value) {
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
                    onChanged: (String? value) {
                      context.read<TagDropdownCubit>().selectTag(value);
                    },
                    hint: Text('태그', style: Theme.of(context).textTheme.bodyMedium),
                    dropdownColor: whiteColor,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.center,
                    iconSize: 0,
                  ),
                ),
              );
            },
          ),
          BlocBuilder<AccordionFavoritesCubit, AccordionFavoritesState>(
            builder: (context, state) {
              return Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: dividerColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: GestureDetector(
                  onTap: () {
                    context.read<AccordionFavoritesCubit>().toggleFavorites();
                  },
                  child: state.isFavorite
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
          Expanded(
            child: BlocBuilder<AccordionChoiceChip, String?>(
              builder: (context, selectedValue) {
                return Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Row(
                    children: formOptions.map((itemValue) {
                      return Expanded(
                        child: Container(
                          height: 35,
                          margin: EdgeInsets.only(right: itemValue == formOptions.last ? 0 : 5),
                          child: ChoiceChip(
                            label: Center(
                              child: Text(
                                itemValue,
                                style: TextStyle(
                                  color: selectedValue == itemValue ? whiteColor : blackColor,
                                ),
                              ),
                            ),
                            padding: EdgeInsets.zero,
                            selectedColor: ColorPalette.accentColors['blue'],
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: dividerColor),
                              borderRadius: BorderRadius.circular(8),
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
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
