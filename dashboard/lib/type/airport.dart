class Airport {
  String? name;
  String? iata_code;
  String? city;

  Airport({
    required this.name,
    required this.iata_code,
    required this.city,
  });

  Airport.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    iata_code = json['iata_code'];
    city = json['city'];
  }
}
