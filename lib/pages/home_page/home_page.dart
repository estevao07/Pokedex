import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex_mobx/consts/consts_app.dart';
import 'package:pokedex_mobx/models/pokeapi.dart';
import 'package:pokedex_mobx/pages/home_page/widgets/poke_item.dart';
import 'package:pokedex_mobx/store/pokeapi_store.dart';

import 'widgets/app_bar_home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokeApiStore? pokeApiStore;

  @override
  void initState() {
    super.initState();
    pokeApiStore = PokeApiStore();
    pokeApiStore!.fetchPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    double screenWith = MediaQuery.of(context).size.width;
    double statusWith = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              top: -(240 / 4.7),
              left: screenWith - (240 / 1.6),
              child: Opacity(
                opacity: 0.1,
                child: Image.asset(
                  ConstApp.whitePokeBall,
                  height: 240,
                  width: 240,
                ),
              )),
          Container(
            child: Column(
              children: [
                Container(
                  height: statusWith,
                ),
                AppBarHome(),
                Expanded(
                  child: Container(
                    child: Observer(
                      name: 'ListaHomePage',
                      builder: (BuildContext context) {
                        return (pokeApiStore!.pokeAPI != null)
                            ? AnimationLimiter(
                                child: GridView.builder(
                                  physics: BouncingScrollPhysics(),
                                  padding: EdgeInsets.all(12),
                                  addAutomaticKeepAlives: true,
                                  gridDelegate:
                                      new SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2),
                                  itemCount:
                                      pokeApiStore!.pokeAPI!.pokemon.length,
                                  itemBuilder: (context, index) {
                                    Pokemon pokemon =
                                        pokeApiStore!.getPokemon(index: index);
                                    return AnimationConfiguration.staggeredGrid(
                                      position: index,
                                      duration:
                                          const Duration(milliseconds: 375),
                                      columnCount: 2,
                                      child: ScaleAnimation(
                                        child: GestureDetector(
                                          child: PokeItem(
                                            types: pokemon.type,
                                            index: index,
                                            name: pokemon.name,
                                            cod: pokemon.id,
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (BuildContext
                                                          context) =>
                                                      Container() /*PokeDetailPage(index: index)*/,
                                                  fullscreenDialog: true,
                                                ));
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
