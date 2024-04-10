import 'package:dashboard/menu/travel_details_dialog.dart';
import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:dashboard/map/country_iso_util.dart';
import 'package:dashboard/map/colored_map.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:dashboard/requests/result.dart';
import 'package:dashboard/config.dart';

import '../popup/airport_not_selected.dart';
import '../type/destination_country.dart';
import 'destination_country_card.dart';

typedef DestinationCallback = void Function(String iso, String? iata);

class Menu extends StatefulWidget {
  const Menu(
      {Key? key,
      required this.isMenuOpen,
      required this.destinations,
      required this.currentCountry,
      required this.destinationUpdateFunction,
      required this.currentIso})
      : super(key: key);

  final String currentIso;
  final DestinationCallback destinationUpdateFunction;

  final bool isMenuOpen;
  final List<Country> destinations;
  final List<Country> currentCountry;
  //double _sliderValue = 0.0; // Variable pour stocker la valeur sélectionnée du slider

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _showElements = false;
  String? _selectedCountry;
  bool _showCountryOptions = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void didUpdateWidget(covariant Menu oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isMenuOpen) {
      _controller.forward();
      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          _showElements = true;
        });
      });
    } else {
      _controller.reverse();
      setState(() {
        _showElements = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget getEmptyCountryListWidget() {
    if (widget.currentIso == "") {
      return Container(
          margin: const EdgeInsets.only(top: 20, left: 5, right: 5),
          child: const DefaultTextStyle(
            style: TextStyle(
              color: surface_text_color,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontFamily: 'Signika',
            ),
            child: Text(
              "Vous n'avez selectionné aucun pays",
              textAlign: TextAlign.left,
            ),
          ));
    } else {
      return Container(
          margin: const EdgeInsets.only(top: 20, left: 5, right: 5),
          child: const DefaultTextStyle(
            style: TextStyle(
              color: surface_text_color,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontFamily: 'Signika',
            ),
            child: Text(
              "Nous ne disposons d'aucune données pour ce pays.",
              textAlign: TextAlign.left,
            ),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> airport = widget.destinations
        .map((country) => DestinationCountryCard(
              country: country,
              selected_country: _selectedCountry,
            ))
        .toList();
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Visibility(
            visible: _animation.value == 1.0,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              color: Colors.transparent, //couleur du volet
              margin:
                  const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildCountryExpansionTile(), // Génération de la tile du pays cliqué

                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: airport,
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }

  Widget _buildRadioListTile(String iata, String? city) {
    return RadioListTile(
      title: Text(city != null ? "${iata} - ${city}" : "${iata}"),
      value: iata,
      groupValue: _selectedCountry,
      toggleable: true,
      onChanged: _onRadioListTileSelected,
    );
  }

  Widget _buildCountryExpansionTile() {
    return Card(
      color: Color.fromRGBO(200, 240, 200, 0.75),
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(25), // Rayon de la bordure de la Card
      ),
      elevation: 1, // Élévation de la Card
      child: Container(
        // Envelopper la ExpansionTile dans un Container
        child: ExpansionTile(
          collapsedShape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(15), // Bordure de la tuile réduite
          ),
          shape: RoundedRectangleBorder(
            borderRadius: _showCountryOptions
                ? BorderRadius.circular(30) // Bordure de la tuile ouverte
                : BorderRadius.circular(
                    0), // Bordure de la tuile réduite // Bordure de la tuile ouverte
          ),
          tilePadding: const EdgeInsets.symmetric(
              horizontal: 16.0), // Espacement interne de la ExpansionTile
          backgroundColor: Colors.grey,
          leading: CircleAvatar(
            backgroundImage: AssetImage(
                'flags/${widget.currentCountry.isNotEmpty ? widget.currentCountry.first.iso!.toLowerCase() : "empty"}.jpg'),
            radius: 15,
          ),
          title: Text(
              'Départ : ${widget.currentCountry.isNotEmpty ? widget.currentCountry.first.getCountryName() : ""}'),
          subtitle: Text(widget.destinations.isNotEmpty
              ? ""
              : "pas de données disponibles"),
          onExpansionChanged: (expanded) {
            setState(() {
              _showCountryOptions = expanded;
            });
          },
          trailing: Icon(
            _showCountryOptions
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down,
          ),
          /*
          List<Widget> airport = widget.destinations
        .map((country) => DestinationCountryCard(country: country))
        .toList();
           */
          children: _showCountryOptions
              ? (widget.currentCountry.isNotEmpty
                  ? widget.currentCountry.first.airports!
                      .map((airport) =>
                          _buildRadioListTile(airport.iata_code!, airport.city))
                      .toList()
                  : [])
              : [],
        ),
      ),
    );
  }

  void _onRadioListTileSelected(String? value) {
    setState(() {
      if (_selectedCountry == value) {
        _selectedCountry =
            null; // Déselectionner si la même option est sélectionnée
      } else {
        if (value == null) {
          print(
              "Unselected ${value} - country: ${widget.currentIso} | value: ${value}");
        }
        _selectedCountry = value; // Sélectionner la nouvelle option
        widget.destinationUpdateFunction(widget.currentIso, value);
      }
    });
  }
}
