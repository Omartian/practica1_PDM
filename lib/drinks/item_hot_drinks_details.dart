import 'package:estructura_practica_1/cart/payment.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemHotDrinksDetails extends StatefulWidget {
  final ProductHotDrinks drink;
  ItemHotDrinksDetails({
    Key key,
    @required this.drink,
  }) : super(key: key);

  @override
  _ItemHotDrinksDetailsState createState() => _ItemHotDrinksDetailsState();
}

class _ItemHotDrinksDetailsState extends State<ItemHotDrinksDetails> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var price = widget.drink.productPrice;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("${widget.drink.productTitle}"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
            color: CONTRAST_COLOR,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
                    child: Icon(
                      widget.drink.liked
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: widget.drink.liked ? Colors.red : null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 32),
                  child: Image.network(
                    "${widget.drink.productImage}",
                    width: 350,
                    height: 250,
                  ),
                )
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "${widget.drink.productTitle}",
                style: Theme.of(context).textTheme.title.copyWith(
                      fontSize: 32,
                      fontFamily: 'AkzidenzGrotesk',
                    ),
              )),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "${widget.drink.productDescription}",
              style: Theme.of(context).textTheme.title.copyWith(
                  fontSize: 20,
                  fontFamily: 'AkzidenzGrotesk',
                  fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "TAMAÑOS DISPONIBLES",
                  style: Theme.of(context).textTheme.title.copyWith(
                      fontSize: 16,
                      fontFamily: 'AkzidenzGrotesk',
                      fontWeight: FontWeight.w300),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(96, 0, 0, 0),
                  child: Row(
                    children: [
                      Icon(Icons.attach_money),
                      Text(
                        "${widget.drink.productPrice}",
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .copyWith(fontSize: 22),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                        side: BorderSide(color: CONTRAST_COLOR)),
                    color: widget.drink.productSize == ProductSize.CH
                        ? CONTRAST_COLOR
                        : Colors.white,
                    child: Text("Chico"),
                    onPressed: () {
                      setState(() {
                        widget.drink.productSize = ProductSize.CH;
                        widget.drink.productPrice =
                            widget.drink.productPriceCalculator();
                      });
                    }),
                MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                        side: BorderSide(color: CONTRAST_COLOR)),
                    color: widget.drink.productSize == ProductSize.M
                        ? CONTRAST_COLOR
                        : Colors.white,
                    child: Text("Mediano"),
                    onPressed: () {
                      setState(() {
                        widget.drink.productSize = ProductSize.M;
                        widget.drink.productPrice =
                            widget.drink.productPriceCalculator();
                      });
                    }),
                MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                        side: BorderSide(color: CONTRAST_COLOR)),
                    color: widget.drink.productSize == ProductSize.G
                        ? CONTRAST_COLOR
                        : Colors.white,
                    child: Text("Grande"),
                    onPressed: () {
                      setState(() {
                        widget.drink.productSize = ProductSize.G;
                        widget.drink.productPrice =
                            widget.drink.productPriceCalculator();
                      });
                    })
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                    color: ACCENT_COLOR,
                    height: 50,
                    minWidth: 180,
                    child: Text(
                      "AGREGAR AL CARRITO",
                      style: Theme.of(context).textTheme.title.copyWith(
                          fontSize: 14,
                          fontFamily: 'AkzidenzGrotezk',
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    onPressed: () {
                      _addToCart();
                    }),
                MaterialButton(
                    color: ACCENT_COLOR,
                    height: 50,
                    minWidth: 180,
                    child: Text(
                      "COMPRAR AHORA",
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
          )
        ],
      ),
    );
  }

  void _addToCart() {
    bool exists = false;
    for (ProductItemCart product in cartlist) {
      if (product.productTitle == widget.drink.productTitle) {
        exists = true;
      }
    }
    if (!exists) {
      ProductItemCart product = new ProductItemCart(
          productTitle: widget.drink.productTitle,
          productAmount: 1,
          productPrice: widget.drink.productPrice,
          productImage: widget.drink.productImage,
          liked: widget.drink.liked);
      cartlist.add(product);
      final snackBar = SnackBar(content: Text("Producto agregado al carrito"));
      _scaffoldKey.currentState
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    } else {
      final snackBar =
          SnackBar(content: Text("El producto ya se encontraba en el carrito"));
      _scaffoldKey.currentState
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }
}
