// To parse this JSON data, do
//
//     final allDragonsModel = allDragonsModelFromJson(jsonString);

import 'dart:convert';

class AllDragonsModel {
  String? id;
  String? name;
  String? type;
  bool? active;
  int? crewCapacity;
  int? sidewallAngleDeg;
  int? orbitDurationYr;
  int? dryMassKg;
  int? dryMassLb;
  DateTime? firstFlight;
  HeatShield? heatShield;
  List<Thruster>? thrusters;
  PayloadMass? launchPayloadMass;
  LaunchPayloadVol? launchPayloadVol;
  PayloadMass? returnPayloadMass;
  LaunchPayloadVol? returnPayloadVol;
  PressurizedCapsule? pressurizedCapsule;
  Trunk? trunk;
  Diameter? heightWTrunk;
  Diameter? diameter;
  List<String>? flickrImages;
  String? wikipedia;
  String? description;

  AllDragonsModel({
    this.id,
    this.name,
    this.type,
    this.active,
    this.crewCapacity,
    this.sidewallAngleDeg,
    this.orbitDurationYr,
    this.dryMassKg,
    this.dryMassLb,
    this.firstFlight,
    this.heatShield,
    this.thrusters,
    this.launchPayloadMass,
    this.launchPayloadVol,
    this.returnPayloadMass,
    this.returnPayloadVol,
    this.pressurizedCapsule,
    this.trunk,
    this.heightWTrunk,
    this.diameter,
    this.flickrImages,
    this.wikipedia,
    this.description,
  });

  AllDragonsModel copyWith({
    String? id,
    String? name,
    String? type,
    bool? active,
    int? crewCapacity,
    int? sidewallAngleDeg,
    int? orbitDurationYr,
    int? dryMassKg,
    int? dryMassLb,
    DateTime? firstFlight,
    HeatShield? heatShield,
    List<Thruster>? thrusters,
    PayloadMass? launchPayloadMass,
    LaunchPayloadVol? launchPayloadVol,
    PayloadMass? returnPayloadMass,
    LaunchPayloadVol? returnPayloadVol,
    PressurizedCapsule? pressurizedCapsule,
    Trunk? trunk,
    Diameter? heightWTrunk,
    Diameter? diameter,
    List<String>? flickrImages,
    String? wikipedia,
    String? description,
  }) =>
      AllDragonsModel(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        active: active ?? this.active,
        crewCapacity: crewCapacity ?? this.crewCapacity,
        sidewallAngleDeg: sidewallAngleDeg ?? this.sidewallAngleDeg,
        orbitDurationYr: orbitDurationYr ?? this.orbitDurationYr,
        dryMassKg: dryMassKg ?? this.dryMassKg,
        dryMassLb: dryMassLb ?? this.dryMassLb,
        firstFlight: firstFlight ?? this.firstFlight,
        heatShield: heatShield ?? this.heatShield,
        thrusters: thrusters ?? this.thrusters,
        launchPayloadMass: launchPayloadMass ?? this.launchPayloadMass,
        launchPayloadVol: launchPayloadVol ?? this.launchPayloadVol,
        returnPayloadMass: returnPayloadMass ?? this.returnPayloadMass,
        returnPayloadVol: returnPayloadVol ?? this.returnPayloadVol,
        pressurizedCapsule: pressurizedCapsule ?? this.pressurizedCapsule,
        trunk: trunk ?? this.trunk,
        heightWTrunk: heightWTrunk ?? this.heightWTrunk,
        diameter: diameter ?? this.diameter,
        flickrImages: flickrImages ?? this.flickrImages,
        wikipedia: wikipedia ?? this.wikipedia,
        description: description ?? this.description,
      );

  factory AllDragonsModel.fromRawJson(String str) => AllDragonsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllDragonsModel.fromJson(Map<String, dynamic> json) => AllDragonsModel(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    active: json["active"],
    crewCapacity: json["crew_capacity"],
    sidewallAngleDeg: json["sidewall_angle_deg"],
    orbitDurationYr: json["orbit_duration_yr"],
    dryMassKg: json["dry_mass_kg"],
    dryMassLb: json["dry_mass_lb"],
    firstFlight: json["first_flight"] == null ? null : DateTime.parse(json["first_flight"]),
    heatShield: json["heat_shield"] == null ? null : HeatShield.fromJson(json["heat_shield"]),
    thrusters: json["thrusters"] == null ? [] : List<Thruster>.from(json["thrusters"]!.map((x) => Thruster.fromJson(x))),
    launchPayloadMass: json["launch_payload_mass"] == null ? null : PayloadMass.fromJson(json["launch_payload_mass"]),
    launchPayloadVol: json["launch_payload_vol"] == null ? null : LaunchPayloadVol.fromJson(json["launch_payload_vol"]),
    returnPayloadMass: json["return_payload_mass"] == null ? null : PayloadMass.fromJson(json["return_payload_mass"]),
    returnPayloadVol: json["return_payload_vol"] == null ? null : LaunchPayloadVol.fromJson(json["return_payload_vol"]),
    pressurizedCapsule: json["pressurized_capsule"] == null ? null : PressurizedCapsule.fromJson(json["pressurized_capsule"]),
    trunk: json["trunk"] == null ? null : Trunk.fromJson(json["trunk"]),
    heightWTrunk: json["height_w_trunk"] == null ? null : Diameter.fromJson(json["height_w_trunk"]),
    diameter: json["diameter"] == null ? null : Diameter.fromJson(json["diameter"]),
    flickrImages: json["flickr_images"] == null ? [] : List<String>.from(json["flickr_images"]!.map((x) => x)),
    wikipedia: json["wikipedia"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "active": active,
    "crew_capacity": crewCapacity,
    "sidewall_angle_deg": sidewallAngleDeg,
    "orbit_duration_yr": orbitDurationYr,
    "dry_mass_kg": dryMassKg,
    "dry_mass_lb": dryMassLb,
    "first_flight": "${firstFlight!.year.toString().padLeft(4, '0')}-${firstFlight!.month.toString().padLeft(2, '0')}-${firstFlight!.day.toString().padLeft(2, '0')}",
    "heat_shield": heatShield?.toJson(),
    "thrusters": thrusters == null ? [] : List<dynamic>.from(thrusters!.map((x) => x.toJson())),
    "launch_payload_mass": launchPayloadMass?.toJson(),
    "launch_payload_vol": launchPayloadVol?.toJson(),
    "return_payload_mass": returnPayloadMass?.toJson(),
    "return_payload_vol": returnPayloadVol?.toJson(),
    "pressurized_capsule": pressurizedCapsule?.toJson(),
    "trunk": trunk?.toJson(),
    "height_w_trunk": heightWTrunk?.toJson(),
    "diameter": diameter?.toJson(),
    "flickr_images": flickrImages == null ? [] : List<dynamic>.from(flickrImages!.map((x) => x)),
    "wikipedia": wikipedia,
    "description": description,
  };
}

class Diameter {
  double? meters;
  double? feet;

  Diameter({
    this.meters,
    this.feet,
  });

  Diameter copyWith({
    double? meters,
    double? feet,
  }) =>
      Diameter(
        meters: meters ?? this.meters,
        feet: feet ?? this.feet,
      );

  factory Diameter.fromRawJson(String str) => Diameter.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Diameter.fromJson(Map<String, dynamic> json) => Diameter(
    meters: json["meters"]?.toDouble(),
    feet: json["feet"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "meters": meters,
    "feet": feet,
  };
}

class HeatShield {
  String? material;
  double? sizeMeters;
  int? tempDegrees;
  String? devPartner;

  HeatShield({
    this.material,
    this.sizeMeters,
    this.tempDegrees,
    this.devPartner,
  });

  HeatShield copyWith({
    String? material,
    double? sizeMeters,
    int? tempDegrees,
    String? devPartner,
  }) =>
      HeatShield(
        material: material ?? this.material,
        sizeMeters: sizeMeters ?? this.sizeMeters,
        tempDegrees: tempDegrees ?? this.tempDegrees,
        devPartner: devPartner ?? this.devPartner,
      );

  factory HeatShield.fromRawJson(String str) => HeatShield.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HeatShield.fromJson(Map<String, dynamic> json) => HeatShield(
    material: json["material"],
    sizeMeters: json["size_meters"]?.toDouble(),
    tempDegrees: json["temp_degrees"],
    devPartner: json["dev_partner"],
  );

  Map<String, dynamic> toJson() => {
    "material": material,
    "size_meters": sizeMeters,
    "temp_degrees": tempDegrees,
    "dev_partner": devPartner,
  };
}

class PayloadMass {
  int? kg;
  int? lb;

  PayloadMass({
    this.kg,
    this.lb,
  });

  PayloadMass copyWith({
    int? kg,
    int? lb,
  }) =>
      PayloadMass(
        kg: kg ?? this.kg,
        lb: lb ?? this.lb,
      );

  factory PayloadMass.fromRawJson(String str) => PayloadMass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PayloadMass.fromJson(Map<String, dynamic> json) => PayloadMass(
    kg: json["kg"],
    lb: json["lb"],
  );

  Map<String, dynamic> toJson() => {
    "kg": kg,
    "lb": lb,
  };
}

class LaunchPayloadVol {
  int? cubicMeters;
  int? cubicFeet;

  LaunchPayloadVol({
    this.cubicMeters,
    this.cubicFeet,
  });

  LaunchPayloadVol copyWith({
    int? cubicMeters,
    int? cubicFeet,
  }) =>
      LaunchPayloadVol(
        cubicMeters: cubicMeters ?? this.cubicMeters,
        cubicFeet: cubicFeet ?? this.cubicFeet,
      );

  factory LaunchPayloadVol.fromRawJson(String str) => LaunchPayloadVol.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LaunchPayloadVol.fromJson(Map<String, dynamic> json) => LaunchPayloadVol(
    cubicMeters: json["cubic_meters"],
    cubicFeet: json["cubic_feet"],
  );

  Map<String, dynamic> toJson() => {
    "cubic_meters": cubicMeters,
    "cubic_feet": cubicFeet,
  };
}

class PressurizedCapsule {
  LaunchPayloadVol? payloadVolume;

  PressurizedCapsule({
    this.payloadVolume,
  });

  PressurizedCapsule copyWith({
    LaunchPayloadVol? payloadVolume,
  }) =>
      PressurizedCapsule(
        payloadVolume: payloadVolume ?? this.payloadVolume,
      );

  factory PressurizedCapsule.fromRawJson(String str) => PressurizedCapsule.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PressurizedCapsule.fromJson(Map<String, dynamic> json) => PressurizedCapsule(
    payloadVolume: json["payload_volume"] == null ? null : LaunchPayloadVol.fromJson(json["payload_volume"]),
  );

  Map<String, dynamic> toJson() => {
    "payload_volume": payloadVolume?.toJson(),
  };
}

class Thruster {
  String? type;
  int? amount;
  int? pods;
  String? fuel1;
  String? fuel2;
  int? isp;
  Thrust? thrust;

  Thruster({
    this.type,
    this.amount,
    this.pods,
    this.fuel1,
    this.fuel2,
    this.isp,
    this.thrust,
  });

  Thruster copyWith({
    String? type,
    int? amount,
    int? pods,
    String? fuel1,
    String? fuel2,
    int? isp,
    Thrust? thrust,
  }) =>
      Thruster(
        type: type ?? this.type,
        amount: amount ?? this.amount,
        pods: pods ?? this.pods,
        fuel1: fuel1 ?? this.fuel1,
        fuel2: fuel2 ?? this.fuel2,
        isp: isp ?? this.isp,
        thrust: thrust ?? this.thrust,
      );

  factory Thruster.fromRawJson(String str) => Thruster.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Thruster.fromJson(Map<String, dynamic> json) => Thruster(
    type: json["type"],
    amount: json["amount"],
    pods: json["pods"],
    fuel1: json["fuel_1"],
    fuel2: json["fuel_2"],
    isp: json["isp"],
    thrust: json["thrust"] == null ? null : Thrust.fromJson(json["thrust"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "amount": amount,
    "pods": pods,
    "fuel_1": fuel1,
    "fuel_2": fuel2,
    "isp": isp,
    "thrust": thrust?.toJson(),
  };
}

class Thrust {
  double? kN;
  int? lbf;

  Thrust({
    this.kN,
    this.lbf,
  });

  Thrust copyWith({
    double? kN,
    int? lbf,
  }) =>
      Thrust(
        kN: kN ?? this.kN,
        lbf: lbf ?? this.lbf,
      );

  factory Thrust.fromRawJson(String str) => Thrust.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Thrust.fromJson(Map<String, dynamic> json) => Thrust(
    kN: json["kN"]?.toDouble(),
    lbf: json["lbf"],
  );

  Map<String, dynamic> toJson() => {
    "kN": kN,
    "lbf": lbf,
  };
}

class Trunk {
  LaunchPayloadVol? trunkVolume;
  Cargo? cargo;

  Trunk({
    this.trunkVolume,
    this.cargo,
  });

  Trunk copyWith({
    LaunchPayloadVol? trunkVolume,
    Cargo? cargo,
  }) =>
      Trunk(
        trunkVolume: trunkVolume ?? this.trunkVolume,
        cargo: cargo ?? this.cargo,
      );

  factory Trunk.fromRawJson(String str) => Trunk.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Trunk.fromJson(Map<String, dynamic> json) => Trunk(
    trunkVolume: json["trunk_volume"] == null ? null : LaunchPayloadVol.fromJson(json["trunk_volume"]),
    cargo: json["cargo"] == null ? null : Cargo.fromJson(json["cargo"]),
  );

  Map<String, dynamic> toJson() => {
    "trunk_volume": trunkVolume?.toJson(),
    "cargo": cargo?.toJson(),
  };
}

class Cargo {
  int? solarArray;
  bool? unpressurizedCargo;

  Cargo({
    this.solarArray,
    this.unpressurizedCargo,
  });

  Cargo copyWith({
    int? solarArray,
    bool? unpressurizedCargo,
  }) =>
      Cargo(
        solarArray: solarArray ?? this.solarArray,
        unpressurizedCargo: unpressurizedCargo ?? this.unpressurizedCargo,
      );

  factory Cargo.fromRawJson(String str) => Cargo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cargo.fromJson(Map<String, dynamic> json) => Cargo(
    solarArray: json["solar_array"],
    unpressurizedCargo: json["unpressurized_cargo"],
  );

  Map<String, dynamic> toJson() => {
    "solar_array": solarArray,
    "unpressurized_cargo": unpressurizedCargo,
  };
}
