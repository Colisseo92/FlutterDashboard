import 'package:flutter/material.dart';
import 'package:dashboard/menu/menu_widget.dart';
import 'package:dashboard/map/country_iso_util.dart';
import 'package:dashboard/map/colored_map.dart';
import 'package:dashboard/map/map_widget.dart';
import 'config.dart';

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
  double _width = 50; // Taille plus petite pour le bouton
  double _height = 50; // Taille plus petite pour le bouton
  Color c = mistyRose; // Couleur pour le bouton
  BorderRadiusGeometry _borderRadius =
      BorderRadius.circular(20); // Forme légèrement carrée
  IconData _icon = Icons.add; // Icône de +

  bool isMenuOpen = false;

  String currentCountry = "";
  String previousCountry = "";
  String currentCountryName = "";

  void onColorChange(String id) {
    setState(() {
      previousCountry = currentCountry;
      currentCountry = id;
      currentCountryName = getCountryWithIso(id)!;
      if (id == "") {
        toggleMenu();
      }
    });
  }

  void toggleMenu() {
    setState(() {
      if (isMenuOpen) {
        _width = 0; // Retour à la taille initiale
        _height = 0; // Retour à la taille initiale
        _borderRadius = BorderRadius.circular(50); // Forme légèrement carrée
        c = mistyRose; //Couleur
        _icon = Icons.add;
        isMenuOpen = false;
      } else {
        _width = MediaQuery.of(context).size.width *
            0.3; // Nouvelle largeur du volet
        _height = MediaQuery.of(context).size.height; // Taille de l'écran
        _borderRadius = BorderRadius.circular(10);
        c = mistyRose; // Couleur lorsque le volet est ouvert
        _icon = Icons.remove;
        isMenuOpen = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('plane.jpeg',
                fit: BoxFit.cover,
                alignment: Alignment(0, -0.4) // Aligner l'image en haut
                ),
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: AppBar(
                title: Text(
                  "   WorldFlightInfo",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Signika',
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      // Ajoutez ici la logique pour la recherche
                    },
                    icon: Icon(Icons.search),
                  ),
                ],
                centerTitle: false,
                elevation: 0.0,
                backgroundColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            left: isMenuOpen ? 0 : null,
            right: isMenuOpen ? null : 0,
            child: Container(
                //color: Colors.black.withOpacity(0.0),
                ),
          ),
          Row(
            children: <Widget>[
              InkWell(
                onTap: toggleMenu,
                child: AnimatedContainer(
                  margin: const EdgeInsets.only(top: 90),
                  alignment: Alignment.center,
                  height: _height,
                  width: _width,
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                  decoration: BoxDecoration(
                    color: c,
                    borderRadius: isMenuOpen
                        ? BorderRadius.circular(20)
                        : BorderRadius.circular(
                            20), // Arrondir les coins du volet si ouvert, sinon pas d'arrondi
                  ),
                  // Décaler le volet vers le bas de 90 pixels
                  child: Menu(isMenuOpen: isMenuOpen),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height,
                  color: const Color.fromRGBO(45, 52, 54, 1.0),
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
            ],
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(45, 52, 54, 1.0),
    );
  }
}
