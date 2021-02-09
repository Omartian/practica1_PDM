// TODO: Crear producto "ProductCup" siguiendo la logica de Drinks y Grains
// TODO: Agregar al ProductRepository una lista de estos productos.
import 'dart:math';

import 'package:flutter/foundation.dart';

enum ProductQuantity { UNIDAD, MEDIA_DOCENA, DOCENA }

class ProductDessert {
  final String productTitle; // nombre del producto
  final String productDescription; // descripcion del producto
  final String productImage; // url de imagen del producto
  ProductQuantity productQuantity; // tamano del producto
  double productPrice; // precio del producto autocalculado
  final int productAmount; // cantidad de producto por comprar
  final bool liked;

  ProductDessert({
    @required this.productTitle,
    @required this.productDescription,
    @required this.productImage,
    @required this.productQuantity,
    @required this.productAmount,
    this.liked = false,
  }) {
    // inicializa el precio de acuerdo al quantity del producto
    productPrice = productPriceCalculator();
  }

  double productPriceCalculator() {
    if (this.productQuantity == ProductQuantity.UNIDAD)
      return (20 + Random().nextInt(40)).toDouble() * 1;
    if (this.productQuantity == ProductQuantity.MEDIA_DOCENA)
      return (40 + Random().nextInt(60)).toDouble() * 6;
    if (this.productQuantity == ProductQuantity.DOCENA)
      return (40 + Random().nextInt(60)).toDouble() * 12;
    return 9999.0;
  }
}
