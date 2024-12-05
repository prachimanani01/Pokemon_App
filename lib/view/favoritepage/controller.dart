import 'package:flutter/material.dart';
import 'package:pokemon_app/modal/detailmodal.dart';

class FavoritesProvider with ChangeNotifier {
  final List<DetailModal> _favorites = [];

  List<DetailModal> get favorites => _favorites;

  void addFavorite(DetailModal detailModal) {
    if (!_favorites.contains(detailModal)) {
      _favorites.add(detailModal);
      notifyListeners();
    }
  }

  void removeFavorite(DetailModal data) {
    _favorites.remove(data);
    notifyListeners();
  }

  bool isFavorite(DetailModal detailModal) {
    return _favorites.contains(detailModal);
  }
}
