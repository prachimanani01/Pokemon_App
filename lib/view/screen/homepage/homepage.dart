import 'package:flutter/material.dart';
import 'package:pokemon_app/modal/pokemonmodal.dart';

import '../../../helper/api_helper.dart';
import '../../../routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pokemon characters",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.favorite_page);
            },
            icon: Icon(Icons.favorite_border_outlined),
          ),
        ],
      ),
      body: FutureBuilder(
        future: APIHelper.apiHelper.fetchPokemonResult(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Center(
              child: Text("Error : ${snapShot.error}"),
            );
          } else if (snapShot.hasData) {
            List<Result> result = snapShot.data ?? [];

            return GridView.builder(
              itemCount: result.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 3,
                childAspectRatio: 0.80,
                crossAxisSpacing: 4,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  APIHelper.apiHelper
                      .fetchPokemonAbilities(api: result[index].url)
                      .then(
                        (value) => Navigator.pushNamed(
                          context,
                          Routes.details_page,
                          arguments: value,
                        ),
                      );
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://i.pinimg.com/736x/3f/eb/2a/3feb2a1e149e2a8a0c9b8063cf8efd2e.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Spacer(),
                      Text(
                        result[index].name,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
