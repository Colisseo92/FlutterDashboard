import 'package:dashboard/map/country_iso_util.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/type/destination_country.dart';
import '../config.dart';
import 'travel_details_dialog.dart';

class DestinationCountryCard extends StatelessWidget {
  final Country country;

  const DestinationCountryCard({
    required this.country,
    super.key,
  });

  Widget _buildCityExpansionTile(
      BuildContext context, String? city, String iata) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      title: Text(city != null ? "${iata} - ${city}" : "${iata}"),
      onTap: () {
        travelDetailsDialog(context, city!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: card_surface,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ExpansionTile(
        backgroundColor: card_surface, // Couleur de fond de la tuile
        //iconColor: Colors.black, // Couleur de l'icône lorsque la tuile est ouverte
        textColor: text_color, // Couleur du texte
        //collapsedTextColor: Colors.black, // Couleur du texte lorsque la tuile est réduite
        collapsedShape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(15), // Bordure de la tuile réduite
        ),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(15), // Bordure de la tuile ouverte
        ),
        leading: CircleAvatar(
          backgroundImage: AssetImage('flags/${country.iso}.jpg'),
          radius: 15,
        ),
        title: Text(getCountryWithIso(country.iso!.toLowerCase())!),
        subtitle: Text("${country.airports!.length} aéroports"),
        children: country.airports!
            .map((city) =>
                _buildCityExpansionTile(context, city.city, city.iata_code!))
            .toList(),
      ),
    );
  }
}
