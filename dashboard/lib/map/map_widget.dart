//Widget qui permet d'afficher la carte
import 'package:countries_world_map/countries_world_map.dart';
import 'package:countries_world_map/data/maps/world_map.dart';
import 'package:dashboard/requests/destination.dart';
import 'country_color_util.dart';
import 'country_iso_util.dart';
import 'colored_map.dart';
import 'package:dashboard/config.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/requests/countries.dart';
import 'package:dashboard/requests/result.dart';

//Création d'un type (comme int ou double) qui permet de recquérir une fonction
typedef MapColorCallback = void Function(String countryId);

class MapWidget extends StatelessWidget {
  const MapWidget(
      {super.key,
      required this.onMapColorChange,
      required this.current_country_frequency});

  final Map<String, dynamic> current_country_frequency;
  final MapColorCallback
      onMapColorChange; //fonction utilisé pour changer le pays actuel et ancien pays coloré

  //Fonction qui permet de changer le pays coloré
  Map<String, Color> getMapOfColoredCountry(BuildContext context) {
    colorCountries(country_empty_color);
    if (ColoredMap.of(context)!.currentCountry != "") {
      //Si le pays qui doit être colorié n'est pas nul ou une chaine vide
      getCountriesColor()[ColoredMap.of(context)!.currentCountry] =
          country_selected_color; //Changer la valeur de sa couleur dans la Map qui gère la couleur des pays
    }
    if (ColoredMap.of(context)!.previousCountry != "") {
      if (ColoredMap.of(context)!.previousCountry !=
          ColoredMap.of(context)!.currentCountry) {
        //Pareil pour le pays qui était coloré avant mais doit retrouvé sa couleur de base
        getCountriesColor()[ColoredMap.of(context)!.previousCountry] =
            country_empty_color;
      }
    }
    if (current_country_frequency.isNotEmpty) {
      int frequency = (current_country_frequency['max_frequency'] / 3).toInt();
      for (final country in current_country_frequency['destinations']) {
        if (country.frequence >= 0 && country.frequence <= frequency) {
          getCountriesColor()[country.iso] = legend_lowest_color;
        } else if (country.frequence > frequency &&
            country.frequence <= 2 * frequency) {
          getCountriesColor()[country.iso] = legend_middle_color;
        } else {
          getCountriesColor()[country.iso] = legend_highest_color;
        }
      }
    }
    return getCountriesColor();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleMap(
      instructions: SMapWorld.instructions,
      countryBorder: CountryBorder(color: Colors.black, width: 0.1),
      defaultColor: mapBackgroundColor,

      colors: getMapOfColoredCountry(context),

      callback: (id, name, tapDetails) async {
        print(id);
        onMapColorChange(id.toString());
      }, //calback
    );
  }
}
