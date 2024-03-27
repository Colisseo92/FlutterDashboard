import 'dart:collection';
import 'package:http/http.dart' as Http;
import 'result.dart';

Future<void> fetchAirport(iso) async {
  var url = Uri.parse('http://localhost:3000/airport/$iso');

  Http.Response response = await Http.get(url, headers: {
    "Accept": "application/json",
    "Access-Control-Allow-Origin": "*"
  });

  print('Response status: ${response.statusCode}');
  if (response.statusCode != 404) {
    apiDatas.update('answer', (value) => response.body);
  } else {
    apiDatas.update('answer', (value) => '[]');
  }
}
