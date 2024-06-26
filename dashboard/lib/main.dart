import 'package:dashboard/map/country_color_util.dart';
import 'package:dashboard/requests/destination.dart';
import 'package:dashboard/requests/result.dart';
import 'package:dashboard/tiles/legend_tile.dart';
import 'package:dashboard/type/destination_country.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/menu/menu_widget.dart';
import 'package:dashboard/map/country_iso_util.dart';
import 'package:dashboard/map/colored_map.dart';
import 'package:dashboard/map/map_widget.dart';
import 'package:dashboard/popup/pop_up_welcome.dart';
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
  double _menu_height = 0; // Taille plus petite pour le bouton
  double _right_margin = 0;
  Color c = mistyRose; // Couleur pour le bouton

  //ANIMATED LEGEND VARS
  double _legend_height = 0;
  double _legend_margin = 0;

  //ANIMATED MAP VARS
  double _map_width = 0;
  double _map_height = 0;

  BorderRadiusGeometry _borderRadius =
      BorderRadius.circular(20); // Forme légèrement carrée

  bool isMenuOpen = false;
  bool _isDialogShown = false;

  List<Country> destinations = [];
  Map<String, dynamic> destination_frequency = {};
  List<Country> country = [];

  String currentCountry = "";
  String previousCountry = "";
  String currentCountryName = "";

  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (!_isDialogShown) {
        showWelcomeDialog(context, setState);
      }
      setState(() {
        _map_height = MediaQuery.of(context).size.height -
            (app_bar_height +
                2 * 10 +
                2 * space_between_surface +
                _legend_height);
        _menu_height = MediaQuery.of(context).size.height -
            (app_bar_height + 2 * 10 + 2 * space_between_surface);
      });
    });
  }

  void onColorChange(String id) async {
    List<Country> _destinations = [];
    List<Country> _country = [];
    bool hasBeenOpened = false;
    if (id != "") {
      _destinations = await getDestinationCountry(id.toString());
      _country = await getCurrentCountryInfo(id.toString());
      destination_frequency = await getDestinationFrequency(id.toString());
    }
    if (isMenuOpen == false) {
      hasBeenOpened = true;
      toggleMenu();
    }
    setState(() {
      if (id != "") {
        previousCountry = currentCountry;
        currentCountry = id;
        currentCountryName = getCountryWithIso(id)!;
      }
      if (id.toString() != "") {
        destinations = _destinations;
        country = _country;
      }
      if (id == "" && !hasBeenOpened) {
        toggleMenu();
      }
    });
  }

  void onUpdateDestination(String iso, String? iata) async {
    List<Country> _destinations = [];
    if (iso != "") {
      if (iata != null) {
        _destinations = await getDestinationCountryWithFilter(
            iso.toString(), iata.toString());
      } else {
        _destinations = await getDestinationCountry(iso.toString());
      }
    }
    setState(() {
      if (iso != "") {
        destinations = _destinations;
      }
    });
  }

  void toggleMenu() {
    setState(() {
      if (isMenuOpen) {
        _width = 0; // Retour à la taille initiale
        _borderRadius = BorderRadius.circular(50); // Forme légèrement carrée
        c = surface_color; //Couleur
        //_icon = Icons.add;
        isMenuOpen = false;
        _right_margin = 0;

        _legend_margin = 0;
        //MODIFICATION VARIABLE MAP
        _legend_height = 0;
        _map_height = MediaQuery.of(context).size.height -
            (app_bar_height +
                2 * 10 +
                2 * space_between_surface +
                _legend_margin);
      } else {
        _width = MediaQuery.of(context).size.width *
            0.2; // Nouvelle largeur du volet
        _borderRadius = BorderRadius.circular(50);
        c = surface_color; // Couleur lorsque le volet est ouvert
        //_icon = Icons.remove;
        _right_margin = 20;

        _legend_margin = space_between_surface;
        //MODIFICATION VARS MAP
        _legend_height = legend_bar_height;
        _map_height = MediaQuery.of(context).size.height -
            (app_bar_height +
                2 * 10 +
                space_between_surface +
                legend_bar_height +
                _legend_margin);
        isMenuOpen = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: background_color,
        ),
        child: Column(
          children: [
            AppBarTile(
              onCountrySelected: onColorChange,
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  AnimatedContainer(
                    margin: EdgeInsets.only(
                        left: 20, right: _right_margin, bottom: 30),
                    alignment: Alignment.center,
                    height: _menu_height,
                    width: _width,
                    duration: animation_duration,
                    curve: animation_curve,
                    decoration: BoxDecoration(
                      color: surface_color,
                      borderRadius: BorderRadius.circular(
                          20), // Arrondir les coins du volet si ouvert, sinon pas d'arrondi
                    ),
                    // Décaler le volet vers le bas de 90 pixels
                    child: Menu(
                      isMenuOpen: isMenuOpen,
                      destinations: destinations,
                      currentCountry: country,
                      destinationUpdateFunction: onUpdateDestination,
                      currentIso: currentCountry,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AnimatedContainer(
                          duration: animation_duration,
                          curve: animation_curve,
                          alignment: Alignment.topRight,
                          padding: const EdgeInsets.only(bottom: 10),
                          margin: EdgeInsets.only(
                              left: 0, right: 20, bottom: _legend_margin),
                          height: _map_height,
                          width: MediaQuery.of(context).size.width,
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
                                current_country_frequency:
                                    destination_frequency,
                              ),
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: animation_duration,
                          curve: animation_curve,
                          alignment: Alignment.topRight,
                          margin: const EdgeInsets.only(
                              left: 0, right: 20, bottom: 0),
                          height: _legend_height,
                          decoration: BoxDecoration(
                            color: background_sruface_color,
                            borderRadius: BorderRadius.circular(
                                20), // Arrondir les coins du volet si ouvert, sinon pas d'arrondi
                          ),
                          child: LegendTile(
                            frequence: destination_frequency,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
