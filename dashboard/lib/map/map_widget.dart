//Widget qui permet d'afficher la carte
import 'package:countries_world_map/countries_world_map.dart';
import 'package:countries_world_map/data/maps/world_map.dart';
import 'country_color_util.dart';
import 'country_iso_util.dart';
import 'colored_map.dart';
import 'package:dashboard/config.dart';
import 'package:flutter/material.dart';

//Création d'un type (comme int ou double) qui permet de recquérir une fonction
typedef MapColorCallback = void Function(String countryId);

class MapWidget extends StatelessWidget{
  const MapWidget({super.key,required this.onMapColorChange});

  final MapColorCallback onMapColorChange; //fonction utilisé pour changer le pays actuel et ancien pays coloré

  //Fonction qui permet de changer le pays coloré
  Map<String,Color> getMapOfColoredCountry(BuildContext context){
    if(ColoredMap.of(context)!.currentCountry != ""){ //Si le pays qui doit être colorié n'est pas nul ou une chaine vide
      getCountriesColor()[ColoredMap.of(context)!.currentCountry] = countryFullColor; //Changer la valeur de sa couleur dans la Map qui gère la couleur des pays
    }
    if(ColoredMap.of(context)!.previousCountry != ""){ //Pareil pour le pays qui était coloré avant mais doit retrouvé sa couleur de base
      getCountriesColor()[ColoredMap.of(context)!.previousCountry] = countryEmptyColor;
    }
    return getCountriesColor();
  }

  @override
  Widget build(BuildContext context){
    return SimpleMap(
      instructions: SMapWorld.instructions,
      countryBorder: CountryBorder(color: Colors.white,width:1),
      defaultColor: mapBackgroundColor,

      colors: getMapOfColoredCountry(context),

      callback: (id,name,tapDetails){
        onMapColorChange(id.toString());
        print("Country Clicked : ${getCountryWithIso(id)}");
      }, //calback
    );
  }
}
