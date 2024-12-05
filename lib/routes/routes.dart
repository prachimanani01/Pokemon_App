import 'package:flutter/cupertino.dart';
import 'package:pokemon_app/view/favoritepage/favoritepage.dart';
import 'package:pokemon_app/view/screen/detailspage/detailspage.dart';

import '../view/screen/homepage/homepage.dart';
import '../view/screen/splashscreen/splshscreen.dart';

class Routes {
  static String splash_screen = '/';
  static String home_page = 'home_page';
  static String details_page = 'details_page';
  static String favorite_page = 'favorite_page';

  static Map<String, WidgetBuilder> myRoutes = {
    splash_screen: (context) => const Splashscreen(),
    home_page: (context) => const HomePage(),
    details_page: (context) => const Detailspage(),
    favorite_page: (context) => const FavoritePage(),
  };
}
