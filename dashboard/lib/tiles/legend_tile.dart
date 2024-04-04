import 'package:flutter/material.dart';
import 'package:dashboard/config.dart';

class AppBarTile extends StatelessWidget {
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(app_bar_height),
      child: Container(
        margin: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 0),
        decoration: BoxDecoration(
          color: surface_color,
          borderRadius: BorderRadius.circular(
              20), // Arrondir les coins du volet si ouvert, sinon pas d'arrondi
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                title: Text(
                  "   WorldFlightInfo",
                  style: TextStyle(
                    color: surface_text_color,
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
    );
  }
}
