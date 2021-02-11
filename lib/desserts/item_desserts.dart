import 'package:estructura_practica_1/desserts/item_desserts_details.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemDesserts extends StatefulWidget {
  final ProductDessert dessert;
  ItemDesserts({
    Key key,
    @required this.dessert,
  }) : super(key: key);

  @override
  _ItemDessertsState createState() => _ItemDessertsState();
}

class _ItemDessertsState extends State<ItemDesserts> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ItemDessertsDetails(dessert: widget.dessert);
            },
          ),
        );
      },
      child: Card(
        elevation: 8,
        margin: EdgeInsets.all(8.0),
        color: SEC_TEXT_COLOR,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Flexible(
                          child: new Text(
                            "${widget.dessert.productTitle}",
                            style: Theme.of(context).textTheme.title.copyWith(
                                color: Colors.white,
                                fontFamily: 'AkzidenzGrotezk',
                                fontSize: 22),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Row(
                      children: [
                        Icon(Icons.attach_money),
                        Text(
                          "${widget.dessert.productPrice}",
                          style: Theme.of(context).textTheme.title.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 21),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5)),
                child: Image.network(
                  "${widget.dessert.productImage}",
                  fit: BoxFit.fitHeight,
                  height: 150,
                  width: 150,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 120),
              child: IconButton(
                icon: Icon(
                    widget.dessert.liked
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: widget.dessert.liked ? Colors.red : null),
                onPressed: () {
                  setState(() {
                    widget.dessert.liked = !widget.dessert.liked;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
