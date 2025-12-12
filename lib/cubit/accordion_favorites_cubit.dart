import 'package:capstone/state/accordion_favorites_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccordionFavoritesCubit extends Cubit<AccordionFavoritesState> {
  AccordionFavoritesCubit():super(AccordionFavoritesState(isFavorite: false));

  void toggleFavorites() {
    emit(AccordionFavoritesState(isFavorite: !state.isFavorite));
  }
}