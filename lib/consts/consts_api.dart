import 'package:flutter/material.dart';

class ConstAPI {
  static Uri pokeApiURL = Uri.parse(
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");

  static Color getColorType({required String type}) {
    switch (type) {
      case 'Normal':
        return Colors.brown;

      case 'Fire':
        return Colors.red;

      case 'Water':
        return Colors.blue;

      case 'Grass':
        return Colors.green;

      case 'Electric':
        return Colors.amber;

      case 'Ice':
        return Colors.cyanAccent;

      case 'Fighting':
        return Colors.orange;

      case 'Poison':
        return Colors.purple;

      case 'Ground':
        return Colors.orange;

      case 'Flying':
        return Colors.indigo;

      case 'Psychic':
        return Colors.pink;

      case 'Bug':
        return Colors.lightGreen;

      case 'Rock':
        return Colors.grey;

      case 'Ghost':
        return Colors.indigo;

      case 'Dark':
        return Colors.brown;

      case 'Dragon':
        return Colors.indigo;

      case 'Steel':
        return Colors.blueGrey;

      case 'Fairy':
        return Colors.pinkAccent;

      default:
        return Colors.grey;
    }
  }
}
