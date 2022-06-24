class LatLong {
  double? latitude;
  double? longitude;

  LatLong({this.latitude, this.longitude});

  Map<String, dynamic> toDMS(double fd) {
    int degree = fd.toInt();
    fd = (fd - degree) * 60;
    int minute = fd.toInt();
    double second = (fd - minute) * 60;
    return {
      "degree": degree,
      "minute": minute,
      "second": second,
    };
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.latitude != null) {
      data['latitude'] = toDMS(this.latitude!);
    }
    if (this.longitude != null) {
      data['longitude'] = toDMS(this.longitude!);
    }
    return data;
  }
}
