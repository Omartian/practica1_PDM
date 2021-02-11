import 'package:estructura_practica_1/desserts/item_desserts.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/profile.dart';
import 'package:flutter/material.dart';

class DessertsPage extends StatelessWidget {
  final List<ProductDessert> desserts;
  DessertsPage({
    Key key,
    @required this.desserts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Postres"),
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
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(
        itemCount: desserts.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemDesserts(
            dessert: desserts[index],
          );
        },
      ),
    );
  }
}
