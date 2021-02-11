import 'package:estructura_practica_1/cart/payment.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemDessertsDetails extends StatefulWidget {
  final ProductDessert dessert;
  ItemDessertsDetails({
    Key key,
    @required this.dessert,
  }) : super(key: key);

  @override
  _ItemDessertsDetailsState createState() => _ItemDessertsDetailsState();
}

class _ItemDessertsDetailsState extends State<ItemDessertsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.dessert.productTitle}"),
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
                      widget.dessert.liked
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: widget.dessert.liked ? Colors.red : null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 32),
                  child: Image.network(
                    "${widget.dessert.productImage}",
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
                "${widget.dessert.productTitle}",
                style: Theme.of(context).textTheme.title.copyWith(
                      fontSize: 32,
                      fontFamily: 'AkzidenzGrotesk',
                    ),
              )),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "${widget.dessert.productDescription}",
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
                  "CANTIDADES DISPONIBLES",
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
                        "${widget.dessert.productPrice}",
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
                    color:
                        widget.dessert.productQuantity == ProductQuantity.UNIDAD
                            ? CONTRAST_COLOR
                            : Colors.white,
                    child: Text("Unidad"),
                    onPressed: () {
                      setState(() {
                        widget.dessert.productQuantity = ProductQuantity.UNIDAD;
                        widget.dessert.productPrice =
                            widget.dessert.productPriceCalculator();
                      });
                    }),
                MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                        side: BorderSide(color: CONTRAST_COLOR)),
                    color: widget.dessert.productQuantity ==
                            ProductQuantity.MEDIA_DOCENA
                        ? CONTRAST_COLOR
                        : Colors.white,
                    child: Text("Media docena"),
                    onPressed: () {
                      setState(() {
                        widget.dessert.productQuantity =
                            ProductQuantity.MEDIA_DOCENA;
                        widget.dessert.productPrice =
                            widget.dessert.productPriceCalculator();
                      });
                    }),
                MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                        side: BorderSide(color: CONTRAST_COLOR)),
                    color:
                        widget.dessert.productQuantity == ProductQuantity.DOCENA
                            ? CONTRAST_COLOR
                            : Colors.white,
                    child: Text("Docena"),
                    onPressed: () {
                      setState(() {
                        widget.dessert.productQuantity = ProductQuantity.DOCENA;
                        widget.dessert.productPrice =
                            widget.dessert.productPriceCalculator();
                      });
                    }),
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
                    onPressed: () {}),
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
}
