import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_mobx/consts/consts_api.dart';
import 'package:pokedex_mobx/models/pokeapi.dart';
part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  PokeAPI? _pokeAPI;

  @computed
  PokeAPI? get pokeAPI => _pokeAPI;

  @action
  fetchPokemonList() {
    _pokeAPI = null;
    loadPokeAPI().then((pokeList) {
      _pokeAPI = pokeList;
    });
  }

  Future<PokeAPI?> loadPokeAPI() async {
    try {
      final response = await http.get(ConstAPI.pokeApiURL);
      var decodeJson = jsonDecode(response.body);
      return PokeAPI.fromJson(decodeJson);
    } catch (error, stacktrace) {
      print("Erro ao carregar lista de pokemons" + stacktrace.toString());
      return null;
    }
  }

  @action
  getPokemon({required int index}) {
    return _pokeAPI!.pokemon[index];
  }
}
