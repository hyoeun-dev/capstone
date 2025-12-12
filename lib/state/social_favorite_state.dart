class SocialFavoriteState {
  final int index;
  final bool isFavorite;
  final Map<int, bool> currentFavorites;

  SocialFavoriteState({
    required this.index,
    required this.isFavorite,
    required this.currentFavorites
  });
}