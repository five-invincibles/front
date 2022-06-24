import 'dart:convert';

class DMS {
  final int degree;
  final int minute;
  final double second;

  DMS({required this.degree, required this.minute, required this.second});

  Map<String, dynamic> get toJson {
    return {
      'degree': degree,
      'minute': minute,
      'second': second,
    };
  }
}
