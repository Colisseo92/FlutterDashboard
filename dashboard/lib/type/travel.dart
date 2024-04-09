class Travel {
  int? distance_mile;
  int? distance_km;
  String? from;
  String? to;
  String? time;
  int? mean_prices;
  List<dynamic>? prices;

  Travel({
    required this.distance_km,
    required this.distance_mile,
    required this.from,
    required this.to,
    required this.time,
    required this.prices,
    required this.mean_prices,
  });

  Travel.fromJson(Map<String, dynamic> json) {
    distance_mile = json['distance_mile'] as int;
    distance_km = json['distance_km'] as int;
    from = json['from'] as String;
    to = json['to'] as String;
    time = json['flight_time'];
    mean_prices = json['mean_price'] as int;
    prices = json['prices'] as List<dynamic>;
  }
}
