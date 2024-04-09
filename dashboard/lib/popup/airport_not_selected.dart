import 'package:flutter/material.dart';
import 'package:dashboard/config.dart';

bool _isDialogShown = false;

void AirportNotSelectedPopup(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        title: Column(
          children: [
            Icon(
              Icons.airplanemode_inactive,
              color: Colors.red,
              size: 48,
            ),
            SizedBox(height: 8),
            Text(
              "Erreur",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                //color: legend_highest_color,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),

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
                    text: "Veuillez sélectionner un aéroport de départ pour afficher les données relatives à ce vol. ",
                  ),
                ],
              ),
            ),
            SizedBox(height: 10), // Espacement entre le texte et le bouton
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
