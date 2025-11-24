import 'package:capstone/state/accordion_favorites_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccordionFavoritesCubit extends Cubit<AccordionFavoritesState> {
  AccordionFavoritesCubit():super(AccordionFavoritesState(isFavorites: false));

  void toggleFavorites() {
    emit(AccordionFavoritesState(isFavorites: !state.isFavorites));
  }
}