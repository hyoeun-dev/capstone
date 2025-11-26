import 'package:capstone/state/sorting_dropdown_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortingDropdownCubit extends Cubit<SortingDropdownState>{
  SortingDropdownCubit():super(SortingDropdownState(sortingMenu: ['수행일 순', '마감일 순', '태그 순', '추가 순'], selectedSorting: '수행일 순'));
  List<String> sortingList = ['수행일 순', '마감일 순', '태그 순', '추가 순'];
  void selectTag(String? newSorting) {
      emit(SortingDropdownState(sortingMenu: sortingList, selectedSorting: newSorting));
  }
}