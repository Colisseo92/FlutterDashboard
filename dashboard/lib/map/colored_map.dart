import 'package:flutter/material.dart';

/**
 * Dans une application normale, un enfant très loingtain ne peut pas accèder au
 * tout premier parent.
 * Cependant on en a besoin dans notre programme pour pouvoir changer la couleur des pays
 * On peut donc créer un InheritedWidget qui permet à n'importe quel enfant d'accèder
 * à un parent quelque soit la profondeur à laquelle il est. (indentation)
 */
class ColoredMap extends InheritedWidget{
  //Les required sont les donnée que le widget ColoredMap est obligé d'avoir pour fonctionner
  //Dans notre cas on veut qu'il puisse avoir d'autres widgets en enfant
  //Mais avoir en paramètre (qui seront les variables accessible par les enfants) le moyen de changer la couleur
  //des pays.
  const ColoredMap({
    super.key,
    required super.child,
    required this.currentCountry, //Pays qui est actuellement coloré sur la map
    required this.previousCountry, //Pays dont la couleur doit revenir à la normale
    required this.onColorChange, //Fonction executée pour changer la couleur
  });

  final String currentCountry;
  final String previousCountry;
  final void Function(String id) onColorChange;

  static ColoredMap? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ColoredMap>();
  }

  @override
  bool updateShouldNotify(ColoredMap oldWidget){
    return oldWidget.currentCountry != currentCountry;
  }
}
