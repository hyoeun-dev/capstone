import 'package:capstone/state/tag_dropdown_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TagDropdownCubit extends Cubit<TagDropdownState>{
  TagDropdownCubit():super(TagDropdownState(tags: ['취업', '자기관리', '쇼핑', '취미'], selectedTag: '취업'));
  List<String> tags = ['취업', '자기관리', '쇼핑', '취미'];
  void selectTag(String? newTag) {
      emit(TagDropdownState(tags: tags, selectedTag: newTag));
  }
}