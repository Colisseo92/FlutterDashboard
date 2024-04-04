import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/config.dart';

class LegendTile extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 20),
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
                          color: legend_highest_color,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    const DefaultTextStyle(
                      style: TextStyle(
                          color: surface_text_color,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Signika'),
                      child: Text(
                        textAlign: TextAlign.left,
                        "30-20 vols",
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
                    const DefaultTextStyle(
                      style: TextStyle(
                          color: surface_text_color,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Signika'),
                      child: Text(
                        textAlign: TextAlign.left,
                        "20-10 vols",
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
                          color: legend_lowest_color,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    const DefaultTextStyle(
                      style: TextStyle(
                          color: surface_text_color,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Signika'),
                      child: Text(
                        textAlign: TextAlign.left,
                        "10-0 vols",
                      ),
                    )
                  ],
                ))
          ],
        ));
  }
}
