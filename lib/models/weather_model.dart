// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Weather {
  final String date;
  final String day;
  final String icon;
  final String description;
  final String status;
  final String degree;
  final String min;
  final String max;
  final String night;
  final String humidity;
  Weather({
    required this.date,
    required this.day,
    required this.icon,
    required this.description,
    required this.status,
    required this.degree,
    required this.min,
    required this.max,
    required this.night,
    required this.humidity,
  });

  Weather copyWith({
    String? date,
    String? day,
    String? icon,
    String? description,
    String? status,
    String? degree,
    String? min,
    String? max,
    String? night,
    String? humidity,
  }) {
    return Weather(
      date: date ?? this.date,
      day: day ?? this.day,
      icon: icon ?? this.icon,
      description: description ?? this.description,
      status: status ?? this.status,
      degree: degree ?? this.degree,
      min: min ?? this.min,
      max: max ?? this.max,
      night: night ?? this.night,
      humidity: humidity ?? this.humidity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'day': day,
      'icon': icon,
      'description': description,
      'status': status,
      'degree': degree,
      'min': min,
      'max': max,
      'night': night,
      'humidity': humidity,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      date: map['date'] as String,
      day: map['day'] as String,
      icon: map['icon'] as String,
      description: map['description'] as String,
      status: map['status'] as String,
      degree: map['degree'] as String,
      min: map['min'] as String,
      max: map['max'] as String,
      night: map['night'] as String,
      humidity: map['humidity'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) => Weather.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Weather(date: $date, day: $day, icon: $icon, description: $description, status: $status, degree: $degree, min: $min, max: $max, night: $night, humidity: $humidity)';
  }

  @override
  bool operator ==(covariant Weather other) {
    if (identical(this, other)) return true;
  
    return 
      other.date == date &&
      other.day == day &&
      other.icon == icon &&
      other.description == description &&
      other.status == status &&
      other.degree == degree &&
      other.min == min &&
      other.max == max &&
      other.night == night &&
      other.humidity == humidity;
  }

  @override
  int get hashCode {
    return date.hashCode ^
      day.hashCode ^
      icon.hashCode ^
      description.hashCode ^
      status.hashCode ^
      degree.hashCode ^
      min.hashCode ^
      max.hashCode ^
      night.hashCode ^
      humidity.hashCode;
  }
}
