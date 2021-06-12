import 'package:flutter/material.dart';
import 'package:pokedex_mobx/consts/consts_api.dart';
import 'package:pokedex_mobx/consts/consts_app.dart';

class PokeItem extends StatelessWidget {
  final String? name;
  final int? index;
  final num? cod;
  final List<String> types;
  final Color? color;

  const PokeItem(
      {Key? key,
      this.name,
      this.index,
      this.cod,
      required this.types,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8, top: 8),
                    child: Text(
                      name!,
                      style: TextStyle(
                          fontFamily: "Google",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Opacity(
                  opacity: 0.2,
                  child: Image.asset(
                    ConstApp.whitePokeBall,
                    height: 120,
                    width: 120,
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 120,
                    width: 120,
                    child: Image.network(
                        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$cod.png'),
                  )),
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: ConstAPI.getColorType(type: types[0]),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            )),
      ),
    );
  }
}
