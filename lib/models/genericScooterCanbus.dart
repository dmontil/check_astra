class GenericScooterCanbus {
  String version;
  int battery1Voltage;
  int battery2Voltage;
  int battery1Soc;
  int battery2Soc;
  int battery1currentDrain;
  int battery2currentDrain;
  int status;
  int flags;
  int drivingMode;
  int range;
  int velocity;
  int lifetimeOdometer;

  GenericScooterCanbus(
      {this.version,
        this.battery1Voltage,
        this.battery2Voltage,
        this.battery1Soc,
        this.battery2Soc,
        this.battery1currentDrain,
        this.battery2currentDrain,
        this.status,
        this.flags,
        this.drivingMode,
        this.range,
        this.velocity,
        this.lifetimeOdometer});

  GenericScooterCanbus.fromJson(Map<String, dynamic> json) {
    version = json ['data']['version'];
    battery1Voltage = json['battery1Voltage'];
    battery2Voltage = json['battery2Voltage'];
    battery1Soc = json['battery1Soc'];
    battery2Soc = json['battery2Soc'];
    battery1currentDrain = json['battery1currentDrain'];
    battery2currentDrain = json['battery2currentDrain'];
    status = json['status'];
    flags = json['flags'];
    drivingMode = json['drivingMode'];
    range = json['range'];
    velocity = json['velocity'];
    lifetimeOdometer = json['lifetimeOdometer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    data['battery1Voltage'] = this.battery1Voltage;
    data['battery2Voltage'] = this.battery2Voltage;
    data['battery1Soc'] = this.battery1Soc;
    data['battery2Soc'] = this.battery2Soc;
    data['battery1currentDrain'] = this.battery1currentDrain;
    data['battery2currentDrain'] = this.battery2currentDrain;
    data['status'] = this.status;
    data['flags'] = this.flags;
    data['drivingMode'] = this.drivingMode;
    data['range'] = this.range;
    data['velocity'] = this.velocity;
    data['lifetimeOdometer'] = this.lifetimeOdometer;
    return data;
  }
}