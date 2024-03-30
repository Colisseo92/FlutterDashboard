import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as Http;

Future<List<dynamic>> fetchDestination(iso) async {
  var upper_iso = iso.toString().toUpperCase();
  String link = 'http://localhost:3000/destination/$upper_iso';
  print("LINK TARGETED : $link");
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
