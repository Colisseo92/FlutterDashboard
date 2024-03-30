import 'airport.dart';

class DestinationCountry {
  String? iso;
  List<Airport>? airports;

  DestinationCountry({required this.iso, required this.airports});

  DestinationCountry.fromJson(Map<String, dynamic> json) {
    iso = json['iso'];
    List<dynamic> _airports = json['airport'] as List<dynamic>;
    airports = _airports
        .cast<Map<String, dynamic>>()
        .map((x) => Airport.fromJson(x))
        .toList();
  }

  void displayAirport() {
    for (final airport in airports!) {
      print(airport.name);
      print(airport.iata_code);
    }
  }
}
