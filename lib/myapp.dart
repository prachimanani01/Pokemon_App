import 'package:flutter/material.dart';
import 'package:pokemon_app/routes/routes.dart';
import 'package:pokemon_app/view/favoritepage/controller.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FavoritesProvider(),
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: Routes.myRoutes,
        );
      },
    );
  }
}
