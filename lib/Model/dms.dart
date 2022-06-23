import 'dart:convert';

class DMS {
  final int degree;
  final int minute;
  final int second;

  DMS({required this.degree, required this.minute, required this.second});

  String get toJson {
    return jsonEncode({
      'degree': degree,
      'minute': minute,
      'second': second,
    });
  }
}
