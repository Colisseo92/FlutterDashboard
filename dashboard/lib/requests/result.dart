import 'dart:convert';

import 'package:dashboard/requests/card_infos.dart';
import 'package:dashboard/requests/countries.dart';
import 'package:dashboard/requests/destination.dart';
import 'package:dashboard/type/destination_country.dart';
import 'package:dashboard/type/country_frequency.dart';

import '../type/travel.dart';

Future<List<Country>> getDestinationCountry(iso) async {
  List<dynamic> json = await fetchDestination(iso);
  return json.map((x) => Country.fromJson(x)).toList();
}

Future<List<Country>> getDestinationCountryWithFilter(iso, iata) async {
  List<dynamic> json = await fetchDestinationWithFilter(iso, iata);
  return json.map((x) => Country.fromJson(x)).toList();
}

Future<Travel> getTravelInfo(from, to) async {
  List<dynamic> json = await fetchCardINfos(from, to);
  return json.map((x) => Travel.fromJson(x)).toList().first;
}

Future<List<Country>> getCurrentCountryInfo(iso) async {
  List<dynamic> json = await fetchCountryInfo(iso);
  return json.map((x) => Country.fromJson(x)).toList();
}

Future<Map<String, dynamic>> getDestinationFrequency(iso) async {
  Map<String, dynamic> result = {};
  List<dynamic> json = await fetchDestinationFrequency(iso);
  try {
    result['max_frequency'] = json[0]['max_value'];
    result['destinations'] =
        json[0]['data'].map((x) => CountryWithFrequence.fromJson(x)).toList();
    return result;
  } catch (e) {
    return {};
  }
}
