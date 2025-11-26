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
    return Row(
      children: [
        BlocBuilder<SortingDropdownCubit, SortingDropdownState>(
          builder: (context, state) {
            return Container(
              width: 75,
              height: 35,
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(border: Border.all()),
              child: DropdownButton(
                value: context.watch<SortingDropdownCubit>().state.selectedSorting,
                items: state.sortingMenu.map((String value) {
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
                  context.read<SortingDropdownCubit>().selectTag(value);
                },
                hint: Text('정렬'),
                dropdownColor: whiteColor,
                padding: EdgeInsets.symmetric(horizontal: 8),
                alignment: Alignment.center,
                iconSize: 0,
              ),
            );
          },
        ),
        GestureDetector(
          onTap: () => context.go('/todo/search'),
          child: AbsorbPointer(child: Container(
            width: MediaQuery.of(context).size.width - kDefaultHorizontalPadding - 75,
              padding: EdgeInsets.only(right: kDefaultPadding),
              child: CupertinoSearchTextField(
                placeholder: '검색',
              ))),
        ),
      ],
    );
  }
}
