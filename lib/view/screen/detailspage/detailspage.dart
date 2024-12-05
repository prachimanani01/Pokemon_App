import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../modal/detailmodal.dart';
import '../../favoritepage/controller.dart';

class Detailspage extends StatelessWidget {
  const Detailspage({super.key});

  @override
  Widget build(BuildContext context) {
    DetailModal data =
        ModalRoute.of(context)?.settings.arguments as DetailModal;

    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text("Pokemon"),
            Spacer(),
            IconButton(
              icon: Icon(
                favoritesProvider.isFavorite(data)
                    ? Icons.favorite
                    : Icons.favorite_border_outlined,
                color: Colors.red,
              ),
              onPressed: () {
                if (favoritesProvider.isFavorite(data)) {
                  favoritesProvider.removeFavorite(data);
                } else {
                  favoritesProvider.addFavorite(data);
                }
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Transform.scale(
              scale: 4,
              child: Image.network(
                data.sprites.frontDefault,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 110,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                data.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(),
            Text(
              "Pokémon became one of the most successful video game franchises in the world, second only to Nintendo's Super Mario Bros. The original Pokémon is a role-playing game based around building a small team of monsters to battle other monsters in a quest to become the best.",
            ),
            Divider(),
            Align(
              alignment: Alignment.bottomLeft,
              child:
                  Text("Base Experience : " + data.baseExperience.toString()),
            ),
            SizedBox(
              height: 2,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text("Weight : " + data.weight.toString()),
            ),
            SizedBox(
              height: 2,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text("Order : " + data.order.toString()),
            ),
            SizedBox(
              height: 2,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text("Types : " + data.types[0].type.name),
            ),
          ],
        ),
      ),
    );
  }
}
