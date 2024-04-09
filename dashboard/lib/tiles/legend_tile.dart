import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/config.dart';

class LegendTile extends StatefulWidget {
  const LegendTile({
    Key? key,
    required this.frequence,
  }) : super(key: key);

  final Map<String, dynamic> frequence;
  //double _sliderValue = 0.0; // Variable pour stocker la valeur sélectionnée du slider

  @override
  _LegendTile createState() => _LegendTile();
}

class _LegendTile extends State<LegendTile> {
  int frequency = -1;

  Widget build(BuildContext context) {
    frequency = widget.frequence.isNotEmpty
        ? (widget.frequence['max_frequency'] / 3).toInt()
        : -1;
    return Container(
        padding:
            const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 20),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          color: legend_lowest_color,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    DefaultTextStyle(
                      style: const TextStyle(
                          color: surface_text_color,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Signika'),
                      child: Text(
                        textAlign: TextAlign.left,
                        frequency == -1
                            ? "---"
                            : "0-${frequency} vols / semaine",
                      ),
                    )
                  ],
                )),
            Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          color: legend_middle_color,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    DefaultTextStyle(
                      style: const TextStyle(
                          color: surface_text_color,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Signika'),
                      child: Text(
                        textAlign: TextAlign.left,
                        frequency == -1
                            ? "---"
                            : "${frequency}-${frequency * 2} vols / semaine",
                      ),
                    )
                  ],
                )),
            Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          color: legend_highest_color,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    DefaultTextStyle(
                      style: const TextStyle(
                          color: surface_text_color,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Signika'),
                      child: Text(
                        textAlign: TextAlign.left,
                        frequency == -1
                            ? "---"
                            : "+ ${frequency * 2} vols / semaine",
                      ),

                    )
                  ],
                ))
          ],
        ));
  }
}
