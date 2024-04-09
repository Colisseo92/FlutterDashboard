import 'package:dashboard/config.dart';
import 'package:flutter/material.dart';

bool _isDialogShown = false;

void showWelcomeDialog(BuildContext context, Function setState) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Column(
          children: [
            Icon(
              Icons.flight_takeoff,
              color: legend_highest_color,
              size: 48,
            ),
            SizedBox(height: 8),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: "Bienvenue sur ",
                  ),
                  TextSpan(
                    text: "WorldFlightInfo",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: legend_highest_color,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Le dashboard sur les vols dans le monde !",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: "Nous donnons des informations telles que :"
                        "\n\n- Tous les pays accessibles par ",
                  ),
                  TextSpan(
                    text: "vol direct",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: legend_highest_color,
                    ),
                  ),
                  TextSpan(
                    text: ", depuis un pays donné,"
                        "\n- La ",
                  ),
                  TextSpan(
                    text: "quantité",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: legend_highest_color,
                    ),
                  ),
                  TextSpan(
                    text: " de ces vols par semaine,\n- Les ",
                  ),
                  TextSpan(
                    text: "aéroports disponibles",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: legend_highest_color,
                    ),
                  ),
                  TextSpan(
                    text: " dans les pays de départ et d'arrivée,\n- Le ",
                  ),
                  TextSpan(
                    text: "temps de trajet",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: legend_highest_color,
                    ),
                  ),
                  TextSpan(
                    text: ", la ",
                  ),
                  TextSpan(
                    text: "distance",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: legend_highest_color,
                    ),
                  ),
                  TextSpan(
                    text: " et le ",
                  ),
                  TextSpan(
                    text: "prix moyen",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: legend_highest_color,
                    ),
                  ),
                  TextSpan(
                    text: " de tous les vols existants."
                        "\n\nPour utiliser le dashboard, ",
                  ),
                  TextSpan(
                    text: "cliquez sur le pays ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: legend_highest_color,
                    ),
                  ),
                  TextSpan(
                    text: "d'où vous voulez partir, \nou ",
                  ),
                  TextSpan(
                    text: "cherchez-le",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: legend_highest_color,
                    ),
                  ),
                  TextSpan(
                    text: " directement à l'aide de la barre de recherche en haut à droite."
                        "\n\nCliquez en dehors de la carte",
                  ),
                  TextSpan(
                    text: " pour faire apparaître les informations du pays."
                        "\n\nNous espérons que notre dashboard vous sera utile."
                        "\n\nMerci d'être passé !",
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: Text(
                    "OK",
                    style: TextStyle(
                      color: legend_highest_color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      _isDialogShown = true;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
