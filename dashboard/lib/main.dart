import 'package:dashboard/requests/destination.dart';
import 'package:dashboard/requests/result.dart';
import 'package:dashboard/type/destination_country.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/menu/menu_widget.dart';
import 'package:dashboard/map/country_iso_util.dart';
import 'package:dashboard/map/colored_map.dart';
import 'package:dashboard/map/map_widget.dart';
import 'package:flutter/widgets.dart';
import 'config.dart';

import 'package:dashboard/tiles/app_bar_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WorldFlightInfo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: dashboardTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //ANIMATED MENU VARS
  double _width = 0; // Taille plus petite pour le bouton
  double _height = 0; // Taille plus petite pour le bouton
  double _right_margin = 0;
  Color c = mistyRose; // Couleur pour le bouton

  //ANIMATED LEGEND VARS
  double _legend_width = 0;
  double _legend_height = 0;
  double _legend_margin = 0;

  //ANIMATED MAP VARS
  double _map_width = 0;
  double _map_height = 0;

  BorderRadiusGeometry _borderRadius =
      BorderRadius.circular(20); // Forme légèrement carrée
  IconData _icon = Icons.add; // Icône de +

  bool isMenuOpen = false;

  List<DestinationCountry> destinations = [];

  String currentCountry = "";
  String previousCountry = "";
  String currentCountryName = "";

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _map_width =
            MediaQuery.of(context).size.width - (2 * space_between_surface);
        _map_height = MediaQuery.of(context).size.height -
            (app_bar_height +
                2 * space_between_surface +
                _legend_height +
                2 * _legend_margin);
      });
    });
  }

  void onColorChange(String id) async {
    List<DestinationCountry> _destinations = [];
    if (id != "") {
      _destinations = await getDestinationCountry(id.toString());
    }
    setState(() {
      previousCountry = currentCountry;
      currentCountry = id;
      currentCountryName = getCountryWithIso(id)!;
      if (id.toString() != "") {
        destinations = _destinations;
      }
      if (id == "") {
        toggleMenu();
      }
    });
    for (final e in destinations) {
      print(e.iso);
      e.displayAirport();
    }
  }

  void toggleMenu() {
    setState(() {
      if (isMenuOpen) {
        _width = 0; // Retour à la taille initiale
        _height = MediaQuery.of(context).size.height -
            (app_bar_height + 40); // Taille de l'écran
        _borderRadius = BorderRadius.circular(50); // Forme légèrement carrée
        c = surface_color; //Couleur
        _icon = Icons.add;
        isMenuOpen = false;
        _right_margin = 0;
        //MODIFICATION VARIABLE MAP
        _map_width =
            MediaQuery.of(context).size.width - (2 * space_between_surface);
        _map_height = MediaQuery.of(context).size.height -
            (app_bar_height +
                2 * space_between_surface +
                _legend_height +
                2 * _legend_margin);
      } else {
        _width = MediaQuery.of(context).size.width *
            0.2; // Nouvelle largeur du volet
        _height = MediaQuery.of(context).size.height -
            (app_bar_height + 40); // Taille de l'écran
        _borderRadius = BorderRadius.circular(50);
        c = surface_color; // Couleur lorsque le volet est ouvert
        _icon = Icons.remove;
        _right_margin = 20;
        //MODIFICATION VARS MAP
        print(_width);
        _map_width = MediaQuery.of(context).size.width -
            (2 * _right_margin + _width + space_between_surface);
        print(_map_width);
        _map_height = MediaQuery.of(context).size.height -
            (app_bar_height +
                2 * space_between_surface +
                _legend_height +
                2 * _legend_margin);
        //
        isMenuOpen = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Expanded(
        child: Column(
          children: [
            Expanded(child: AppBarTile()),
            Row(
              children: <Widget>[
                AnimatedContainer(
                  margin: EdgeInsets.only(
                      top: 20, left: 20, right: _right_margin, bottom: 20),
                  alignment: Alignment.center,
                  height: _height,
                  width: _width,
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                  decoration: BoxDecoration(
                    color: surface_color,
                    borderRadius: BorderRadius.circular(
                        20), // Arrondir les coins du volet si ouvert, sinon pas d'arrondi
                  ),
                  // Décaler le volet vers le bas de 90 pixels
                  child:
                      Menu(isMenuOpen: isMenuOpen, destinations: destinations),
                ),
                Expanded(
                  child: Column(
                    children: [
                      SafeArea(
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          alignment: Alignment.topRight,
                          height: _map_height,
                          width: _map_width,
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          margin: const EdgeInsets.only(
                              top: 20, left: 0, right: 20, bottom: 20),
                          decoration: BoxDecoration(
                            color: background_sruface_color,
                            borderRadius: BorderRadius.circular(
                                20), // Arrondir les coins du volet si ouvert, sinon pas d'arrondi
                          ),
                          child: ColoredMap(
                            currentCountry: currentCountry,
                            previousCountry: previousCountry,
                            onColorChange: onColorChange,
                            child: InteractiveViewer(
                              maxScale: 75.0,
                              child: MapWidget(
                                key: UniqueKey(),
                                onMapColorChange: onColorChange,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SafeArea(
                        child: AnimatedContainer(
                          //Related to animation
                          curve: Curves.easeInOut,
                          duration: const Duration(milliseconds: 500),

                          //Related to container
                          height: _legend_height,
                          width: _legend_width,
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          margin: const EdgeInsets.only(
                              top: 0, left: 0, right: 20, bottom: 0),
                          decoration: BoxDecoration(
                            color: background_sruface_color,
                            borderRadius: BorderRadius.circular(
                                20), // Arrondir les coins du volet si ouvert, sinon pas d'arrondi
                          ),
                          child: Text('Test text'),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//https://stackoverflow.com/questions/63233890/flutter-animatedcontainer-transform-from-righttoleft
