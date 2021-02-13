import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemCart extends StatefulWidget {
  final dynamic product;
  final ValueChanged<double> onAmountUpdated;
  ItemCart({
    Key key,
    @required this.onAmountUpdated,
    @required this.product,
  }) : super(key: key);

  @override
  _ItemCartState createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      color: CONTRAST_COLOR,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  "${widget.product.productImage}",
                  height: 120,
                  width: 120,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      "${widget.product.productTitle}",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(fontSize: 32),
                    ),
                    Text(
                      "\$${widget.product.productPrice}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontSize: 28),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.add_circle_outline),
                            onPressed: _addProd),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "${widget.product.productAmount}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(fontSize: 20),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        IconButton(
                            icon: Icon(Icons.remove_circle),
                            onPressed: _remProd),
                        SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(
                          widget.product.liked
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: widget.product.liked ? Colors.red : null),
                      onPressed: () {},
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: _deleteProduct,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  void _addProd() {
    setState(() {
      ++widget.product.productAmount;
    });
    widget.onAmountUpdated(widget.product.productPrice);
  }

  void _deleteProduct() {
    widget.onAmountUpdated(
        -1 * widget.product.productPrice * widget.product.productAmount);
    cartlist.remove(widget.product);
  }

  void _remProd() {
    setState(() {
      if (widget.product.productAmount > 0) {
        --widget.product.productAmount;
        widget.onAmountUpdated(-1 * widget.product.productPrice);
      }
      if (widget.product.productAmount == 0) {
        cartlist.remove(widget.product);
      }
    });
  }
}
