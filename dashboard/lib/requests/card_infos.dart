import 'dart:convert';
import 'package:http/http.dart' as Http;

Future<List<dynamic>> fetchCardINfos(from, to) async {
  var upper_from = from.toString().toUpperCase();
  var upper_to = to.toString().toUpperCase();
  var url = Uri.parse(
      'http://localhost:8081/travel-infos?from=${upper_from}&to=${upper_to}');

  print("URL : ${url}");

  Http.Response response = await Http.get(url, headers: {
    "Accept": "application/json",
    "Access-Control-Allow-Origin": "*"
  });

  print("Status Code : ${response.statusCode}");

  if (response.statusCode != 404) {
    return jsonDecode(response.body);
  } else {
    return [];
  }
}
