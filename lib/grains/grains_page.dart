import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/grains/item_grains.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/profile.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class GrainsPage extends StatelessWidget {
  final List<ProductGrains> grains;
  GrainsPage({
    Key key,
    @required this.grains,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Granos"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Profile()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Cart(productsList: cartlist)),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: grains.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemGrains(
            grain: grains[index],
          );
        },
      ),
    );
  }
}
