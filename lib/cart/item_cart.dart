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
      margin: EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(
            widget.product.productImage,
            height: 300,
            width: 150,
          ),
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
