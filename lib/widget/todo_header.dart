import 'package:capstone/colors.dart';
import 'package:capstone/constants.dart';
import 'package:capstone/cubit/sorting_dropdown_cubit.dart';
import 'package:capstone/state/sorting_dropdown_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding),
      child: Row(
        children: [
          BlocBuilder<SortingDropdownCubit, SortingDropdownState>(
            builder: (context, state) {
              return Container(
                width: 75,
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: mediumGreyColor), // Full border
                  borderRadius: BorderRadius.circular(8), // Soften corners
                  color: whiteColor,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: context.watch<SortingDropdownCubit>().state.selectedSorting,
                    items: state.sortingMenu.map((String value) {
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
                      context.read<SortingDropdownCubit>().selectTag(value);
                    },
                    hint: Text(
                      '정렬',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    dropdownColor: whiteColor,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.center,
                    iconSize: 0,
                  ),
                ),
              );
            },
          ),
          SizedBox(width: kDefaultPadding),
          Expanded(
            child: GestureDetector(
              onTap: () => context.go('/todo/search'),
              child: AbsorbPointer(
                child: SizedBox(
                  height: 35,
                  child: CupertinoSearchTextField(
                    placeholder: '검색',
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: mediumGreyColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    placeholderStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: blackColor.withAlpha(128), height: 1, fontSize: 13), // Adjusted size
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
