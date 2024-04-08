import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as Http;

Future<List<dynamic>> fetchDestination(iso) async {
  var upper_iso = iso.toString().toUpperCase();
  String link = 'http://localhost:3000/destination/$upper_iso';
  var url = Uri.parse(link);

  Http.Response response = await Http.get(url, headers: {
    "Accept": "application/json",
    "Access-Control-Allow-Origin": "*"
  });

  if (response.statusCode != 404) {
    return jsonDecode(response.body);
  } else {
    return [];
  }
}

Future<List<dynamic>> fetchDestinationWithFilter(iso, iata) async {
  var upper_iso = iso.toString().toUpperCase();
  var upper_iata = iata.toString().toUpperCase();
  String link =
      'http://localhost:3000/destination/$upper_iso/filter/${upper_iata}';
  var url = Uri.parse(link);

  Http.Response response = await Http.get(url, headers: {
    "Accept": "application/json",
    "Access-Control-Allow-Origin": "*"
  });

  if (response.statusCode != 404) {
    return jsonDecode(response.body);
  } else {
    return [];
  }
}

Future<List<dynamic>> fetchDestinationFrequency(iso) async {
  var upper_iso = iso.toString().toUpperCase();
  String link = 'http://localhost:3000/destination/frequency/$upper_iso';
  var url = Uri.parse(link);

  Http.Response response = await Http.get(url, headers: {
    "Accept": "application/json",
    "Access-Control-Allow-Origin": "*"
  });

  if (response.statusCode != 404) {
    return jsonDecode(response.body);
  } else {
    return [];
  }
}
