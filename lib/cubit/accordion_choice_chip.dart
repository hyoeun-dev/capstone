import 'package:flutter_bloc/flutter_bloc.dart';

class AccordionChoiceChip extends Cubit<String?>{
  AccordionChoiceChip():super(null);

  void selectItem(String itemValue) {
    if(state == itemValue) {
      emit(null);
    } else {
      emit(itemValue);
    }
  }

}