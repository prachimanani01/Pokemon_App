import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon_app/modal/detailmodal.dart';
import 'package:pokemon_app/modal/pokemonmodal.dart';

class APIHelper {
  APIHelper._();

  static APIHelper apiHelper = APIHelper._();

  get allResults => null;

  Future<List<Result>?> fetchPokemonResult() async {
    Uri url = Uri.parse("https://pokeapi.co/api/v2/pokemon");

    http.Response res = await http.get(url);

    if (res.statusCode == 200) {
      Map<String, dynamic> apiData = jsonDecode(res.body);

      List allResults = apiData['results'];

      List<Result> allResultList = allResults
          .map(
            (e) => Result.fromJson(
              e,
            ),
          )
          .toList();

      return allResultList;
    }
    return null;
  }

  Future<DetailModal?> fetchPokemonAbilities({required String api}) async {
    Uri url = Uri.parse(api);

    http.Response res = await http.get(url);

    if (res.statusCode == 200) {
      Map<String, dynamic> apiData = jsonDecode(res.body);

      DetailModal allPokemon = DetailModal.fromJson(apiData);

      return allPokemon;
    }
    return null;
  }
}
