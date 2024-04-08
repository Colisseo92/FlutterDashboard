import 'package:dashboard/config.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void travelDetailsDialog(BuildContext context, String city, String from) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        title: Text('Détails du trajet de $from à $city'),
        backgroundColor: background_sruface_color,
        content: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  'CO2 produit : beaucoup trop     Distance : 15243 kms\nTemps moyen de trajet : 12h \nPrix moyen de ce trajet : une ptite somme quand même'),
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
                            getTextStyles: (value) => const TextStyle(
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
                            getTextStyles: (value) => const TextStyle(
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
