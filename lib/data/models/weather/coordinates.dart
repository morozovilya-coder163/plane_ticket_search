class Coordinates {
  const Coordinates({
    required this.lat,
    required this.lon,
  });

  final String lat;
  final String lon;

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      lat: json['lat'],
      lon: json['lon'],
    );
  }
}
