class CountryWithFrequence {
  String? iso;
  int? frequence;

  CountryWithFrequence({required this.iso, required this.frequence});

  CountryWithFrequence.fromJson(Map<String, dynamic> json) {
    iso = json['iso'].toString().toLowerCase();
    frequence = json['frequence'] as int;
  }
}
