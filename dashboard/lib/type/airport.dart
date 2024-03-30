class Airport {
  String? name;
  String? iata_code;

  Airport({
    required this.name,
    required this.iata_code,
  });

  Airport.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    iata_code = json['iata_code'];
  }
}
