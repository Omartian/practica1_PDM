import 'package:estructura_practica_1/cart/payment.dart';
import 'package:estructura_practica_1/profile.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/cart/item_cart.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';

class Cart extends StatefulWidget {
  final List<ProductItemCart> productsList;
  Cart({
    Key key,
    @required this.productsList,
  }) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double _total = 0;
  @override
  void initState() {
    super.initState();
    for (var item in widget.productsList) {
      _total += (item.productPrice * item.productAmount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de compras"),
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
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.68,
                child: ListView.builder(
                  itemCount: widget.productsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemCart(
                      onAmountUpdated: _priceUpdate,
                      product: widget.productsList[index],
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 0, 8),
            child: Row(
              children: [
                Text(
                  "Total",
                  style:
                      Theme.of(context).textTheme.title.copyWith(fontSize: 22),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 0, 32),
            child: Row(
              children: [
                Text("\$$_total MX",
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 30))
              ],
            ),
          ),
          MaterialButton(
              color: ACCENT_COLOR,
              height: 50,
              minWidth: 350,
              child: Text(
                "PAGAR",
                style: Theme.of(context).textTheme.title.copyWith(
                    fontSize: 14,
                    fontFamily: 'AkzidenzGrotezk',
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Payment();
                    },
                  ),
                );
              })
        ],
      ),
    );
  }

  void _priceUpdate(double newItemPrice) {
    setState(() {
      _total += newItemPrice;
    });
  }
}
