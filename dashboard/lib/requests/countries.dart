import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as Http;
import 'result.dart';

Future<List<dynamic>> fetchCountryInfo(iso) async {
  var upper_iso = iso.toString().toUpperCase();
  String link = 'http://localhost:3000/countries/infos/$upper_iso';
  var url = Uri.parse(link);

  Http.Response response = await Http.get(url, headers: {
    "Accept": "application/json",
    "Access-Control-Allow-Origin": "*"
  });

  print('Response status: ${response.statusCode}');
  if (response.statusCode != 404) {
    return jsonDecode(response.body);
  } else {
    return [];
  }
}
