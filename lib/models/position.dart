class Position {
  String lastFixTimestamp;
  double latitude;
  double longitude;
  int currentSpeed;
  int maxSpeed;
  int heading;
  int altitude;
  int journeyDistance;

  Position(
      {this.lastFixTimestamp,
      this.latitude,
      this.longitude,
      this.currentSpeed,
      this.maxSpeed,
      this.heading,
      this.altitude,
      this.journeyDistance});

  Position.fromJson(Map<String, dynamic> json) {
    lastFixTimestamp = json['gps_data']['lastFixTimestamp'];
    latitude = json ['gps_data']['latitude'];
    longitude = json ['gps_data']['longitude'];
    currentSpeed = json ['gps_data']['currentSpeed'];
    maxSpeed = json['maxSpeed'];
    heading = json['heading'];
    altitude = json['altitude'];
    journeyDistance = json['journeyDistance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lastFixTimestamp'] = this.lastFixTimestamp;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['currentSpeed'] = this.currentSpeed;
    data['maxSpeed'] = this.maxSpeed;
    data['heading'] = this.heading;
    data['altitude'] = this.altitude;
    data['journeyDistance'] = this.journeyDistance;
    return data;
  }
}
