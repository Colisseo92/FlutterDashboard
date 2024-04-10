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
    returned.add(FlSpot(i + 1, double.parse(liste[i].toString())));
  }
  return returned;
}

void travelDetailsDialogPrice(BuildContext context, Travel travel) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        alignment: Alignment.topCenter,
        title: Text('Détails du trajet de ${travel.from} à ${travel.to}',
            style: const TextStyle(
              color: surface_color,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: background_color2,
        content: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.75,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                textAlign: TextAlign.left,
                'Distance : ${travel.distance_km} kms\nTemps moyen de trajet : ${travel.time} \nPrix moyen de ce trajet : ${travel.mean_prices}\$',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  Text(
                    'Prix moyen par mois de ce trajet',
                    style: TextStyle(
                      fontSize: 18,
                      color: surface_color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 310,
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(
                            show: true,
                            drawVerticalLine: true,
                            drawHorizontalLine: true,
                            horizontalInterval: travel.interval!.toDouble(),
                            verticalInterval: 1,
                            getDrawingHorizontalLine: (value) {
                              return FlLine(
                                color: Colors.grey,
                                strokeWidth: 1,
                              );
                            },
                            getDrawingVerticalLine: (value) {
                              return FlLine(
                                color: Colors.grey,
                                strokeWidth: 1,
                              );
                            }),
                        minY: 0,
                        maxY: travel.max_price!.toDouble(),
                        lineTouchData: LineTouchData(
                            enabled: true,
                            touchTooltipData: LineTouchTooltipData(
                              getTooltipItems: (tspots) {
                                return tspots.map((tspot) {
                                  return LineTooltipItem(
                                      tspot.y.toString() + " \$",
                                      TextStyle(
                                        color: surface_color,
                                      ));
                                }).toList();
                              },
                              tooltipBgColor: background_sruface_color,
                              tooltipRoundedRadius: 20.0,
                            )),
                        lineBarsData: [
                          LineChartBarData(
                            spots: getListPrices(travel.prices),
                            isCurved: false,
                            colors: [surface_color],
                            barWidth: 4,
                            isStrokeCapRound: true,
                            dotData: FlDotData(
                              show: false,
                            ),
                            belowBarData: BarAreaData(
                              show: true,
                              colors: [surface_color.withOpacity(0.3)],
                            ),
                          )
                        ],
                        titlesData: FlTitlesData(
                          bottomTitles: SideTitles(
                            showTitles: true,
                            getTextStyles: (value) => const TextStyle(
                              color: Colors.grey,
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
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            reservedSize: 40,
                            interval: travel.interval!.toDouble(),
                            getTitles: (value) {
                              if (value % 1 == 0) {
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
            child: Text(
              'Fermer',
              style: TextStyle(
                color: surface_color,
              ),
            ),
          ),
        ],
      );
    },
  );
}

void travelDetailsDialogWithoutPrice(BuildContext context, Travel travel) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.center,
          title: Text('Détails du trajet de ${travel.from} à ${travel.to}',
              style: const TextStyle(
                color: surface_color,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: background_color2,
          content: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Text(
                  textAlign: TextAlign.left,
                  'CO2 produit : beaucoup trop     \nDistance : ${travel.distance_km} kms\nTemps moyen de trajet : ${travel.time} \nPrix moyen de ce trajet : Aucune Informations',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ])),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Fermer',
                style: TextStyle(
                  color: surface_color,
                ),
              ),
            ),
          ],
        );
      });
}
