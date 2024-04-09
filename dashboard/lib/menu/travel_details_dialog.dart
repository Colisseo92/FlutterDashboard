import 'package:dashboard/config.dart';
import 'package:dashboard/requests/result.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:collection/collection.dart';
import '../requests/card_infos.dart';
import '../type/travel.dart';

List<FlSpot> getListPrices(List<dynamic>? liste) {
  List<FlSpot> returned = [];
  for (int i = 0; i < liste!.length; i++) {
    returned.add(FlSpot(i + 1, liste[i]));
  }
  return returned;
}

void travelDetailsDialog(BuildContext context, Travel travel) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        title: Text('Détails du trajet de ${travel.from} à ${travel.to}'),
        backgroundColor: Colors.white,
        content: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  'CO2 produit : beaucoup trop     Distance : ${travel.distance_km} kms\nTemps moyen de trajet : ${travel.time} \nPrix moyen de ce trajet : ${travel.mean_prices}\$'),
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
                    height: 300,
                    child: LineChart(
                      LineChartData(
                        minY: 0,
                        maxY: 3000,
                        lineBarsData: [
                          LineChartBarData(
                            spots: getListPrices(travel.prices),
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
                            reservedSize: 40,
                            getTitles: (value) {
                              if (value % 500 == 0) {
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
