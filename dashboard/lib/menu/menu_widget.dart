import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:dashboard/map/country_iso_util.dart';
import 'package:dashboard/map/colored_map.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:dashboard/requests/result.dart';
import 'package:dashboard/config.dart';

import '../type/destination_country.dart';
import 'destination_country_card.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key, required this.isMenuOpen, required this.destinations})
      : super(key: key);

  final bool isMenuOpen;
  final List<DestinationCountry> destinations;
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

  @override
  Widget build(BuildContext context) {
    //faire un map à la place
    List<Widget> airport = widget.destinations
        .map((country) => DestinationCountryCard(country: country))
        .toList();
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Visibility(
            visible: _animation.value == 1.0,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              color: Colors.transparent, //couleur du volet
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

  Widget _buildRadioListTile(String title) {
    return RadioListTile(
      title: Text(title),
      value: title,
      groupValue: _selectedCountry,
      onChanged: _onRadioListTileSelected,
    );
  }

  Widget _buildCountryExpansionTile() {
    return Card(
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
          tilePadding: EdgeInsets.symmetric(
              horizontal: 16.0), // Espacement interne de la ExpansionTile
          leading: CircleAvatar(
            backgroundImage: AssetImage('flags/th.jpg'),
            radius: 15,
          ),
          title: Text('Départ : Pays'),
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
          children: _showCountryOptions
              ? [
                  _buildRadioListTile('Aeroport 1'),
                  _buildRadioListTile('Aeroport 2'),
                  _buildRadioListTile('Aeroport 3'),
                ]
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
        _selectedCountry = value; // Sélectionner la nouvelle option
      }
    });
  }
}
