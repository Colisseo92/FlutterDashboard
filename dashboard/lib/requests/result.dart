import 'dart:convert';

import 'package:dashboard/requests/destination.dart';
import 'package:dashboard/type/destination_country.dart';

getApiData() {
  return json.decode(apiDatas['answer']!);
}

getCountries() {
  return json.decode(apiDatas['countries']!);
}

Future<List<DestinationCountry>> getDestinationCountry(iso) async {
  List<dynamic> json = await fetchDestination(iso);
  return json.map((x) => DestinationCountry.fromJson(x)).toList();
}

Map<String, String> apiDatas = {'answer': '[]', 'countries': '[]'};
