// https://api.spacexdata.com/v3/payloads

// To parse this JSON data, do
//
//     final allPayLoadsModel = allPayLoadsModelFromJson(jsonString);

class AllPayLoadsModel {
  String? payloadId;
  List? noradId;
  bool? reused;
  List<String>? customers;
  String? nationality;
  String? manufacturer;
  String? payloadType;
  dynamic payloadMassKg;
  dynamic payloadMassLbs;
  String? orbit;
  OrbitParams? orbitParams;

  AllPayLoadsModel(
      {this.payloadId,
        this.noradId,
        this.reused,
        this.customers,
        this.nationality,
        this.manufacturer,
        this.payloadType,
        this.payloadMassKg,
        this.payloadMassLbs,
        this.orbit,
        this.orbitParams});

  AllPayLoadsModel.fromJson(Map<String, dynamic> json) {
    payloadId = json['payload_id'];
    if (json['norad_id'] != null) {
      noradId = [];
      json['norad_id'].forEach((v) {
        noradId!.add([""]);
      });
    }
    reused = json['reused'];
    customers = json['customers'].cast<String>();
    nationality = json['nationality'];
    manufacturer = json['manufacturer'];
    payloadType = json['payload_type'];
    payloadMassKg = json['payload_mass_kg'];
    payloadMassLbs = json['payload_mass_lbs'];
    orbit = json['orbit'];
    orbitParams = json['orbit_params'] != null
        ? OrbitParams.fromJson(json['orbit_params'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['payload_id'] = payloadId;
    if (noradId != null) {
      data['norad_id'] = noradId!.map((v) => v.toJson()).toList();
    }
    data['reused'] = reused;
    data['customers'] = customers;
    data['nationality'] = nationality;
    data['manufacturer'] = manufacturer;
    data['payload_type'] = payloadType;
    data['payload_mass_kg'] = payloadMassKg;
    data['payload_mass_lbs'] = payloadMassLbs;
    data['orbit'] = orbit;
    if (orbitParams != null) {
      data['orbit_params'] = orbitParams!.toJson();
    }
    return data;
  }
}

class OrbitParams {
  String? referenceSystem;
  String? regime;
  dynamic longitude;
  dynamic semiMajorAxisKm;
  dynamic eccentricity;
  dynamic periapsisKm;
  dynamic apoapsisKm;
  dynamic inclinationDeg;
  dynamic periodMin;
  dynamic lifespanYears;
  dynamic epoch;
  dynamic meanMotion;
  dynamic raan;
  dynamic argOfPericenter;
  dynamic meanAnomaly;

  OrbitParams(
      {this.referenceSystem,
        this.regime,
        this.longitude,
        this.semiMajorAxisKm,
        this.eccentricity,
        this.periapsisKm,
        this.apoapsisKm,
        this.inclinationDeg,
        this.periodMin,
        this.lifespanYears,
        this.epoch,
        this.meanMotion,
        this.raan,
        this.argOfPericenter,
        this.meanAnomaly});

  OrbitParams.fromJson(Map<String, dynamic> json) {
    referenceSystem = json['reference_system'];
    regime = json['regime'];
    longitude = json['longitude'];
    semiMajorAxisKm = json['semi_major_axis_km'];
    eccentricity = json['eccentricity'];
    periapsisKm = json['periapsis_km'];
    apoapsisKm = json['apoapsis_km'];
    inclinationDeg = json['inclination_deg'];
    periodMin = json['period_min'];
    lifespanYears = json['lifespan_years'];
    epoch = json['epoch'];
    meanMotion = json['mean_motion'];
    raan = json['raan'];
    argOfPericenter = json['arg_of_pericenter'];
    meanAnomaly = json['mean_anomaly'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['reference_system'] = referenceSystem;
    data['regime'] = regime;
    data['longitude'] = longitude;
    data['semi_major_axis_km'] = semiMajorAxisKm;
    data['eccentricity'] = eccentricity;
    data['periapsis_km'] = periapsisKm;
    data['apoapsis_km'] = apoapsisKm;
    data['inclination_deg'] = inclinationDeg;
    data['period_min'] = periodMin;
    data['lifespan_years'] = lifespanYears;
    data['epoch'] = epoch;
    data['mean_motion'] = meanMotion;
    data['raan'] = raan;
    data['arg_of_pericenter'] = argOfPericenter;
    data['mean_anomaly'] = meanAnomaly;
    return data;
  }
}

