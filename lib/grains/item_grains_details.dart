import 'package:estructura_practica_1/grains/item_grains.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemGrainsDetails extends StatefulWidget {
  final ProductGrains grain;
  ItemGrainsDetails({
    Key key,
    @required this.grain,
  }) : super(key: key);

  @override
  _ItemGrainsDetailsState createState() => _ItemGrainsDetailsState();
}

class _ItemGrainsDetailsState extends State<ItemGrainsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.grain.productTitle}"),
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
                      widget.grain.liked
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: widget.grain.liked ? Colors.red : null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 32),
                  child: Image.network(
                    "${widget.grain.productImage}",
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
                "${widget.grain.productTitle}",
                style: Theme.of(context).textTheme.title.copyWith(
                      fontSize: 32,
                      fontFamily: 'AkzidenzGrotesk',
                    ),
              )),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "${widget.grain.productDescription}",
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
                        "${widget.grain.productPrice}",
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
                    color: widget.grain.productWeight == ProductWeight.CUARTO
                        ? CONTRAST_COLOR
                        : Colors.white,
                    child: Text("Cuarto de kilo"),
                    onPressed: () {
                      setState(() {
                        widget.grain.productWeight = ProductWeight.CUARTO;
                        widget.grain.productPrice =
                            widget.grain.productPriceCalculator();
                      });
                    }),
                MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                        side: BorderSide(color: CONTRAST_COLOR)),
                    color: widget.grain.productWeight == ProductWeight.KILO
                        ? CONTRAST_COLOR
                        : Colors.white,
                    child: Text("Kilogramo"),
                    onPressed: () {
                      setState(() {
                        widget.grain.productWeight = ProductWeight.KILO;
                        widget.grain.productPrice =
                            widget.grain.productPriceCalculator();
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
                    onPressed: () {})
              ],
            ),
          )
        ],
      ),
    );
  }
}
