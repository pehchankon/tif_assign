import '../constants.dart';

class Event {
  final int id;
  final String title;
  final String description;
  final String bannerImage;
  final DateTime dateTime;
  final String organiserName;
  final String organiserIcon;
  final String venueName;
  final String venueCity;
  final String venueCountry;
  final String venueCountryCode;

  const Event({
    required this.id,
    required this.title,
    required this.description,
    required this.bannerImage,
    required this.dateTime,
    required this.organiserName,
    required this.organiserIcon,
    required this.venueName,
    required this.venueCity,
    required this.venueCountry,
    required this.venueCountryCode,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      bannerImage: json['banner_image'] as String,
      dateTime: DateTime.parse(json['date_time'] as String),
      organiserName: json['organiser_name'] as String,
      organiserIcon: json['organiser_icon'] as String,
      venueName: json['venue_name'] as String,
      venueCity: json['venue_city'] as String,
      venueCountry: json['venue_country'] as String,
      venueCountryCode: _findCountryID(json['venue_country']),
    );
  }

  static String _findCountryID(String venueCountry) {
    for (var e in kCountriesEnglish) {
      if (e['name'] == venueCountry) {
        return e['code'] ?? '';
      }
    }
    return '';
  }
}
