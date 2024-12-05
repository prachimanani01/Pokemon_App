import 'package:flutter/material.dart';
import 'package:pokemon_app/modal/detailmodal.dart';
import 'package:provider/provider.dart';

import 'controller.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFFFFF),
        title: const Text("Favorite Pokemon"),
      ),
      backgroundColor: Color(0xffFFFFFF),
      body: favoritesProvider.favorites.isEmpty
          ? const Center(
              child: Image(
                  image: NetworkImage(
                      "https://i.pinimg.com/originals/5d/35/e3/5d35e39988e3a183bdc3a9d2570d20a9.gif")))
          : ListView.builder(
              itemCount: favoritesProvider.favorites.length,
              itemBuilder: (context, index) {
                DetailModal detailModal = favoritesProvider.favorites[index];
                return ListTile(
                  title: Text(detailModal.name),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      favoritesProvider.removeFavorite(detailModal);
                    },
                  ),
                );
              },
            ),
    );
  }
}
