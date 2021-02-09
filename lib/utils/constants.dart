import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:flutter/material.dart';

// home
const String APP_TITLE = "Inicio";
// profile
const String PROFILE_TITLE = "Perfil";
const String PROFILE_LOGOUT = "Cerrar sesion";
const String PROFILE_CART = "Lista de compras";
const String PROFILE_WISHES = "Lista de deseos";
const String PROFILE_HISTORY = "Historial de compras";
const String PROFILE_SETTINGS = "Ajustes";
const String PROFILE_NAME = "Anna Doe";
const String PROFILE_EMAIL = "anna@doe.com";
const String PROFILE_PICTURE =
    "https://dkpp.go.id/wp-content/uploads/2018/10/photo.jpg";

// COLORS
const MaterialColor PRIMARY_COLOR = const MaterialColor(
  0xFF214254,
  const <int, Color>{
    50: const Color(0xFF214254),
    100: const Color(0xFF214254),
    200: const Color(0xFF214254),
    300: const Color(0xFF214254),
    400: const Color(0xFF214254),
    500: const Color(0xFF214254),
    600: const Color(0xFF214254),
    700: const Color(0xFF214254),
    800: const Color(0xFF214254),
    900: const Color(0xFF214254),
  },
);

const MaterialColor ACCENT_COLOR = const MaterialColor(
  0xFF8B8175,
  const <int, Color>{
    50: const Color(0xFF8B8175),
    100: const Color(0xFF8B8175),
    200: const Color(0xFF8B8175),
    300: const Color(0xFF8B8175),
    400: const Color(0xFF8B8175),
    500: const Color(0xFF8B8175),
    600: const Color(0xFF8B8175),
    700: const Color(0xFF8B8175),
    800: const Color(0xFF8B8175),
    900: const Color(0xFF8B8175),
  },
);

const MaterialColor TEXT_COLOR = const MaterialColor(
  0xFF121B22,
  const <int, Color>{
    50: const Color(0xFF121B22),
    100: const Color(0xFF121B22),
    200: const Color(0xFF121B22),
    300: const Color(0xFF121B22),
    400: const Color(0xFF121B22),
    500: const Color(0xFF121B22),
    600: const Color(0xFF121B22),
    700: const Color(0xFF121B22),
    800: const Color(0xFF121B22),
    900: const Color(0xFF121B22),
  },
);

const MaterialColor SEC_TEXT_COLOR = const MaterialColor(
  0xFFBCB0A1,
  const <int, Color>{
    50: const Color(0xFFBCB0A1),
    100: const Color(0xFFBCB0A1),
    200: const Color(0xFFBCB0A1),
    300: const Color(0xFFBCB0A1),
    400: const Color(0xFFBCB0A1),
    500: const Color(0xFFBCB0A1),
    600: const Color(0xFFBCB0A1),
    700: const Color(0xFFBCB0A1),
    800: const Color(0xFFBCB0A1),
    900: const Color(0xFFBCB0A1),
  },
);

const MaterialColor IMAGE_BACKGROUND_COLOR = const MaterialColor(
  0xFFFABF7C,
  const <int, Color>{
    50: const Color(0xFFFABF7C),
    100: const Color(0xFFFABF7C),
    200: const Color(0xFFFABF7C),
    300: const Color(0xFFFABF7C),
    400: const Color(0xFFFABF7C),
    500: const Color(0xFFFABF7C),
    600: const Color(0xFFFABF7C),
    700: const Color(0xFFFABF7C),
    800: const Color(0xFFFABF7C),
    900: const Color(0xFFFABF7C),
  },
);

const MaterialColor CONTRAST_COLOR = const MaterialColor(
  0xFFEC9762,
  const <int, Color>{
    50: const Color(0xFFEC9762),
    100: const Color(0xFFEC9762),
    200: const Color(0xFFEC9762),
    300: const Color(0xFFEC9762),
    400: const Color(0xFFEC9762),
    500: const Color(0xFFEC9762),
    600: const Color(0xFFEC9762),
    700: const Color(0xFFEC9762),
    800: const Color(0xFFEC9762),
    900: const Color(0xFFEC9762),
  },
);

// MODEL VARIABLES

List<ProductHotDrinks> drinks =
    ProductRepository.loadProducts(ProductType.BEBIDAS);

List<ProductGrains> grains = ProductRepository.loadProducts(ProductType.GRANO);

List<ProductItemCart> cartlist = new List<ProductItemCart>();

List<ProductDessert> desserts =
    ProductRepository.loadProducts(ProductType.POSTRES);

List<String> cartProds = new List<String>();
