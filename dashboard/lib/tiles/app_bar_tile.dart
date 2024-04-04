import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/config.dart';

class AppBarTile extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      height: app_bar_height,
      margin: const EdgeInsets.only(
          top: 10,
          left: space_between_surface,
          right: space_between_surface,
          bottom: space_between_surface),
      decoration: BoxDecoration(
        color: surface_color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                child: const DefaultTextStyle(
                  style: TextStyle(
                      color: surface_text_color,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Signika'),
                  child: Text(
                    textAlign: TextAlign.left,
                    "WorldFlightInfo",
                  ),
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(right: 20),
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
            ),
          )
        ],
      ),
    );
  }
}
