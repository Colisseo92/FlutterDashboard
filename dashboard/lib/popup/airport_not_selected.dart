import 'package:flutter/material.dart';

void AirportNotSelectedPopup(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Text("Erreur"),
          content: Text('Vous n\'avez selectionnez aucun aéroport de départ.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Ok'),
            ),
          ],
        );
      });
}
