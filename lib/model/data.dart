import 'dart:convert';

class Data {
  int? id;
  String? title;
  String? description;
  String? banner_image;
  String? date_time;
  String? organizer_name;
  String? organizer_icon;
  String? venue_name;
  String? venue_city;
  String? venue_country;

  Data({
    this.id,
    this.title,
    this.description,
    this.banner_image,
    this.date_time,
    this.organizer_name,
    this.organizer_icon,
    this.venue_name,
    this.venue_city,
    this.venue_country,
  });

  Data copyWith({
    int? id,
    String? title,
    String? description,
    String? banner_image,
    String? date_time,
    String? organizer_name,
    String? organizer_icon,
    String? venue_name,
    String? venue_city,
    String? venue_country,
  }) {
    return Data(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      banner_image: banner_image ?? this.banner_image,
      date_time: date_time ?? this.date_time,
      organizer_name: organizer_name ?? this.organizer_name,
      organizer_icon: organizer_icon ?? this.organizer_icon,
      venue_name: venue_name ?? this.venue_name,
      venue_city: venue_city ?? this.venue_city,
      venue_country: venue_country ?? this.venue_country,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (title != null) {
      result.addAll({'title': title});
    }
    if (description != null) {
      result.addAll({'description': description});
    }
    if (banner_image != null) {
      result.addAll({'banner_image': banner_image});
    }
    if (date_time != null) {
      result.addAll({'date_time': date_time});
    }
    if (organizer_name != null) {
      result.addAll({'organizer_name': organizer_name});
    }
    if (organizer_icon != null) {
      result.addAll({'organizer_icon': organizer_icon});
    }
    if (venue_name != null) {
      result.addAll({'venue_name': venue_name});
    }
    if (venue_city != null) {
      result.addAll({'venue_city': venue_city});
    }
    if (venue_country != null) {
      result.addAll({'venue_country': venue_country});
    }

    return result;
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id: map['id']?.toInt(),
      title: map['title'],
      description: map['description'],
      banner_image: map['banner_image'],
      date_time: map['date_time'],
      organizer_name: map['organizer_name'],
      organizer_icon: map['organizer_icon'],
      venue_name: map['venue_name'],
      venue_city: map['venue_city'],
      venue_country: map['venue_country'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(id: $id, title: $title, description: $description, banner_image: $banner_image, date_time: $date_time, organizer_name: $organizer_name, organizer_icon: $organizer_icon, venue_name: $venue_name, venue_city: $venue_city, venue_country: $venue_country)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Data &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.banner_image == banner_image &&
        other.date_time == date_time &&
        other.organizer_name == organizer_name &&
        other.organizer_icon == organizer_icon &&
        other.venue_name == venue_name &&
        other.venue_city == venue_city &&
        other.venue_country == venue_country;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        banner_image.hashCode ^
        date_time.hashCode ^
        organizer_name.hashCode ^
        organizer_icon.hashCode ^
        venue_name.hashCode ^
        venue_city.hashCode ^
        venue_country.hashCode;
  }
}
