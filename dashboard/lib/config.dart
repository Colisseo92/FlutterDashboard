import 'package:flutter/material.dart';

const String dashboardTitle = "Do you want to go somewhere else ?";

const mapBackgroundColor = Colors.black;
const Color rosePastel =
    Color(0xFFFFC0CB); // Rose pastel défini par un code hexadécimal
const Color wengeColor = Color(0xFF645352);
const Color mistyRose = Color(0xD1CBC1FF);
const Color rosyBrown = Color(0xBC8F8FFF);

//APPLICATION COLORS
const background_color = Color.fromRGBO(25, 25, 25, 1.0);
const background_color2 = Color.fromRGBO(74, 79, 64, 1.0);
//const background_sruface_color = Color.fromRGBO(50, 50, 50, 1.0);
const background_sruface_color = Color.fromRGBO( 48,51,42,1.0);
const surface_color = Color.fromRGBO(182, 230, 85,0.75); //couleur volet
const card_surface = const Color.fromRGBO(214, 233, 186, 1.0); //couleur bouton
const text_color = Colors.black;

const surface_text_color = Colors.white;

//MAP COLORS
const Color country_empty_color = Colors.grey;
const Color country_selected_color = Color.fromRGBO(207, 60, 58, 1.0);
//LEGEND COLORS
const Color legend_highest_color2 = Color.fromRGBO(40, 54, 16, 1.0);
const Color legend_highest_color = Color.fromRGBO(85, 114, 32, 1.0);
const Color legend_middle_color = Color.fromRGBO(145, 202, 39, 1.0);
const Color legend_lowest_color = Color.fromRGBO(218, 251, 157, 1.0);
//ANIMATION DURATION
const Duration animation_duration = Duration(milliseconds: 500);
const Curve animation_curve = Curves.easeInSine;
//APPLICATION SIZES
const double app_bar_height = 60;
const double legend_bar_height = 80;
const double space_between_surface = 20;

class CustomColors {
  static const Map<int, Color> _pinkSwatch = {
    50: Color.fromRGBO(255, 182, 193, 1),
    100: Color.fromRGBO(255, 182, 193, 1),
    200: Color.fromRGBO(255, 182, 193, 1),
    300: Color.fromRGBO(255, 182, 193, 1),
    400: Color.fromRGBO(30, 28, 28, 1.0),
    500: Color.fromRGBO(255, 182, 193, 1),
    600: Color.fromRGBO(209, 203, 193, 1.0),
    700: Color.fromRGBO(255, 228, 225, 1.0),
    800: Color.fromRGBO(246, 208, 217, 1.0),
    900: Color.fromRGBO(232, 162, 171, 1.0),
  };

  static const MaterialColor rosePastel =
      MaterialColor(0xF6D0D9FF, _pinkSwatch);
  static const MaterialColor rosePastel3 =
      MaterialColor(0xECBCC2FF, _pinkSwatch);
  static const MaterialColor rosePastel2 =
      MaterialColor(0xE8A2ABFF, _pinkSwatch);
  static const MaterialColor misty = MaterialColor(0xA1C6CEFF, _pinkSwatch);
}
