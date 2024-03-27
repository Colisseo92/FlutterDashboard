import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:dashboard/map/country_iso_util.dart';
import 'package:dashboard/map/colored_map.dart';
import 'package:fl_chart/fl_chart.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key, required this.isMenuOpen}) : super(key: key);

  final bool isMenuOpen;

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
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Visibility(
          visible: _animation.value == 1.0,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            color: Color.fromRGBO(209, 203, 197, 1.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                _buildCountryExpansionTile(), // Utilisation du nouveau ExpansionTile
                ListView(
                  shrinkWrap: true,
                  children: [
                    _buildExpansionTileCard('Pays 1', [
                      'Ville 1 - Aeroport',
                      'Ville 2 - Aeroport'
                    ]),
                    _buildExpansionTileCard('Pays 2', [
                      'Ville 1 - Aeroport 1',
                      'Ville 1 - Aeroport 2'
                    ]),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }


  Widget _buildRadioListTile(String title) {
    return RadioListTile(
      title: Text(title),
      value: title,
      groupValue: _selectedCountry,
      onChanged: (value) {
        setState(() {
          _selectedCountry = value.toString();
        });
      },
    );
  }

  Widget _buildExpansionTileCard(String title, List<String> cities) {
    return ExpansionTileCard(
      leading: CircleAvatar(
        backgroundImage: AssetImage('flags/th.jpg'),
        radius: 15,
      ),
      title: Text(title),
      subtitle: Text("Nombres de villes / d'aéroports"),
      children: cities.map((city) => _buildCityExpansionTile(city)).toList(),
    );
  }

  Widget _buildCityExpansionTile(String city) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      title: Text(city),
      onTap: () {
        _showTravelDetailsDialog(context, city);
      },
    );
  }

  Widget _buildCountryExpansionTile() {
    return ExpansionTileCard(
      leading: CircleAvatar(
        backgroundImage: AssetImage('flags/th.jpg'),
        radius: 15,
      ),
      title: Text('Pays'),

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
    );
  }


  void _showTravelDetailsDialog(BuildContext context, String city) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Text('Détails du trajet de xxx à $city'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('CO2 produit : beaucoup trop     Distance : 15243 kms\nTemps moyen de trajet : 12h \nPrix moyen de ce trajet : une ptite somme quand même'),
              SizedBox(height: 20),
              Column(
                children: [
                  Text(
                    'Prix moyen par mois de ce trajet',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    child: LineChart(
                      LineChartData(
                        minY: 0,
                        maxY: 500,
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              FlSpot(1, 100),
                              FlSpot(2, 150),
                              FlSpot(3, 200),
                              FlSpot(4, 50),
                              FlSpot(5, 300),
                              FlSpot(6, 25),
                              FlSpot(7, 75),
                              FlSpot(8, 420),
                              FlSpot(9, 40),
                              FlSpot(10, 60),
                              FlSpot(11, 200),
                              FlSpot(12, 100),
                              FlSpot(13, 30),
                            ],
                            isCurved: true,
                            colors: [Colors.lightBlueAccent],
                            barWidth: 4,
                          ),
                        ],
                        titlesData: FlTitlesData(
                          bottomTitles: SideTitles(
                            showTitles: true,
                            getTextStyles: (value) =>
                            const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            getTitles: (value) {
                              switch (value.toInt()) {
                                case 1:
                                  return 'Jan';
                                case 2:
                                  return 'Fev';
                                case 3:
                                  return 'Mar';
                                case 4:
                                  return 'Avr';
                                case 5:
                                  return 'Mai';
                                case 6:
                                  return 'Juin';
                                case 7:
                                  return 'Juil';
                                case 8:
                                  return 'Août';
                                case 9:
                                  return 'Sept';
                                case 10:
                                  return 'Oct';
                                case 11:
                                  return 'Nov';
                                case 12:
                                  return 'Dec';
                                default:
                                  return '';
                              }
                            },
                          ),
                          leftTitles: SideTitles(
                            showTitles: true,
                            getTextStyles: (value) =>
                            const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            getTitles: (value) {
                              if (value % 100 == 0) {
                                return value.toInt().toString();
                              } else {
                                return '';
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fermer'),
            ),
          ],
        );
      },
    );
  }
}
