import 'package:capstone/state/accordion_favorites_state.dart';
import 'package:capstone/state/social_favorite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialFavoriteCubit extends Cubit<SocialFavoriteState> {
  final Map<int, bool> map = {0: false, 1: false, 2: false, 3: false, 4: false};
  SocialFavoriteCubit():super(SocialFavoriteState(index: 0, isFavorite: false, currentFavorites: {}));

  void toggleFavorites(int index) {
    bool currentValue = map[index] ?? false;
    map[index] = !currentValue;

    emit(SocialFavoriteState(
        index: index,
        isFavorite: map[index]!,
        currentFavorites: Map.from(map)
    ));
  }
}