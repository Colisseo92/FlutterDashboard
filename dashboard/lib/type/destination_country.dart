import 'package:dashboard/map/country_iso_util.dart';

import 'airport.dart';

class Country {
  String? iso;
  List<Airport>? airports;

  Country({required this.iso, required this.airports});

  Country.fromJson(Map<String, dynamic> json) {
    iso = json['iso'];
    List<dynamic> _airports = json['airport'] as List<dynamic>;
    airports = _airports
        .cast<Map<String, dynamic>>()
        .map((x) => Airport.fromJson(x))
        .toList();
  }

  String? getCountryName() {
    return getCountryWithIso(iso!.toLowerCase());
  }

  void displayAirport() {
    for (final airport in airports!) {
      print(airport.name);
      print(airport.iata_code);
    }
  }
}
