import 'package:flutter/material.dart';

const String dashboardTitle = "Do you want to go somewhere else ?";

const countryEmptyColor = Colors.grey;
const countryFullColor = Colors.deepPurple;
const mapBackgroundColor = Colors.black;
const Color rosePastel = Color(0xFFFFC0CB); // Rose pastel défini par un code hexadécimal
const Color wengeColor = Color(0xFF645352);
const Color mistyRose = Color(0xD1CBC1FF);
const Color rosyBrown = Color(0xBC8F8FFF);





class CustomColors {
  static const Map<int, Color> _pinkSwatch = {
    50: Color.fromRGBO(255, 182, 193, 1),
    100: Color.fromRGBO(255, 182, 193, 1),
    200: Color.fromRGBO(255, 182, 193, 1),
    300: Color.fromRGBO(255, 182, 193, 1),
    400: Color.fromRGBO(255, 182, 193, 1),
    500: Color.fromRGBO(255, 182, 193, 1),
    600: Color.fromRGBO(209, 203, 193, 1.0),
    700: Color.fromRGBO(255, 228, 225, 1.0),
    800: Color.fromRGBO(246, 208, 217, 1.0),
    900: Color.fromRGBO(232, 162, 171, 1.0),
  };

  static const MaterialColor rosePastel = MaterialColor(0xF6D0D9FF, _pinkSwatch);
  static const MaterialColor rosePastel3 = MaterialColor(0xECBCC2FF, _pinkSwatch);
  static const MaterialColor rosePastel2 = MaterialColor(0xE8A2ABFF, _pinkSwatch);
  static const MaterialColor misty = MaterialColor(0xA1C6CEFF, _pinkSwatch);
}
