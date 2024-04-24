// https://api.spacexdata.com/v3/rockets/falcon9

// To parse this JSON data, do
//
//     final oneRocketModel = oneRocketModelFromJson(jsonString);

import 'dart:convert';

class OneRocketModel {
  int? id;
  bool? active;
  int? stages;
  int? boosters;
  int? costPerLaunch;
  int? successRatePct;
  DateTime? firstFlight;
  String? country;
  String? company;
  Diameter? height;
  Diameter? diameter;
  Mass? mass;
  List<PayloadWeight>? payloadWeights;
  FirstStage? firstStage;
  SecondStage? secondStage;
  Engines? engines;
  LandingLegs? landingLegs;
  List<String>? flickrImages;
  String? wikipedia;
  String? description;
  String? rocketId;
  String? rocketName;
  String? rocketType;

  OneRocketModel({
    this.id,
    this.active,
    this.stages,
    this.boosters,
    this.costPerLaunch,
    this.successRatePct,
    this.firstFlight,
    this.country,
    this.company,
    this.height,
    this.diameter,
    this.mass,
    this.payloadWeights,
    this.firstStage,
    this.secondStage,
    this.engines,
    this.landingLegs,
    this.flickrImages,
    this.wikipedia,
    this.description,
    this.rocketId,
    this.rocketName,
    this.rocketType,
  });

  OneRocketModel copyWith({
    int? id,
    bool? active,
    int? stages,
    int? boosters,
    int? costPerLaunch,
    int? successRatePct,
    DateTime? firstFlight,
    String? country,
    String? company,
    Diameter? height,
    Diameter? diameter,
    Mass? mass,
    List<PayloadWeight>? payloadWeights,
    FirstStage? firstStage,
    SecondStage? secondStage,
    Engines? engines,
    LandingLegs? landingLegs,
    List<String>? flickrImages,
    String? wikipedia,
    String? description,
    String? rocketId,
    String? rocketName,
    String? rocketType,
  }) =>
      OneRocketModel(
        id: id ?? this.id,
        active: active ?? this.active,
        stages: stages ?? this.stages,
        boosters: boosters ?? this.boosters,
        costPerLaunch: costPerLaunch ?? this.costPerLaunch,
        successRatePct: successRatePct ?? this.successRatePct,
        firstFlight: firstFlight ?? this.firstFlight,
        country: country ?? this.country,
        company: company ?? this.company,
        height: height ?? this.height,
        diameter: diameter ?? this.diameter,
        mass: mass ?? this.mass,
        payloadWeights: payloadWeights ?? this.payloadWeights,
        firstStage: firstStage ?? this.firstStage,
        secondStage: secondStage ?? this.secondStage,
        engines: engines ?? this.engines,
        landingLegs: landingLegs ?? this.landingLegs,
        flickrImages: flickrImages ?? this.flickrImages,
        wikipedia: wikipedia ?? this.wikipedia,
        description: description ?? this.description,
        rocketId: rocketId ?? this.rocketId,
        rocketName: rocketName ?? this.rocketName,
        rocketType: rocketType ?? this.rocketType,
      );

  factory OneRocketModel.fromRawJson(String str) => OneRocketModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OneRocketModel.fromJson(Map<String, dynamic> json) => OneRocketModel(
    id: json["id"],
    active: json["active"],
    stages: json["stages"],
    boosters: json["boosters"],
    costPerLaunch: json["cost_per_launch"],
    successRatePct: json["success_rate_pct"],
    firstFlight: json["first_flight"] == null ? null : DateTime.parse(json["first_flight"]),
    country: json["country"],
    company: json["company"],
    height: json["height"] == null ? null : Diameter.fromJson(json["height"]),
    diameter: json["diameter"] == null ? null : Diameter.fromJson(json["diameter"]),
    mass: json["mass"] == null ? null : Mass.fromJson(json["mass"]),
    payloadWeights: json["payload_weights"] == null ? [] : List<PayloadWeight>.from(json["payload_weights"]!.map((x) => PayloadWeight.fromJson(x))),
    firstStage: json["first_stage"] == null ? null : FirstStage.fromJson(json["first_stage"]),
    secondStage: json["second_stage"] == null ? null : SecondStage.fromJson(json["second_stage"]),
    engines: json["engines"] == null ? null : Engines.fromJson(json["engines"]),
    landingLegs: json["landing_legs"] == null ? null : LandingLegs.fromJson(json["landing_legs"]),
    flickrImages: json["flickr_images"] == null ? [] : List<String>.from(json["flickr_images"]!.map((x) => x)),
    wikipedia: json["wikipedia"],
    description: json["description"],
    rocketId: json["rocket_id"],
    rocketName: json["rocket_name"],
    rocketType: json["rocket_type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "active": active,
    "stages": stages,
    "boosters": boosters,
    "cost_per_launch": costPerLaunch,
    "success_rate_pct": successRatePct,
    "first_flight": "${firstFlight!.year.toString().padLeft(4, '0')}-${firstFlight!.month.toString().padLeft(2, '0')}-${firstFlight!.day.toString().padLeft(2, '0')}",
    "country": country,
    "company": company,
    "height": height?.toJson(),
    "diameter": diameter?.toJson(),
    "mass": mass?.toJson(),
    "payload_weights": payloadWeights == null ? [] : List<dynamic>.from(payloadWeights!.map((x) => x.toJson())),
    "first_stage": firstStage?.toJson(),
    "second_stage": secondStage?.toJson(),
    "engines": engines?.toJson(),
    "landing_legs": landingLegs?.toJson(),
    "flickr_images": flickrImages == null ? [] : List<dynamic>.from(flickrImages!.map((x) => x)),
    "wikipedia": wikipedia,
    "description": description,
    "rocket_id": rocketId,
    "rocket_name": rocketName,
    "rocket_type": rocketType,
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

class Engines {
  int? number;
  String? type;
  String? version;
  String? layout;
  Isp? isp;
  int? engineLossMax;
  String? propellant1;
  String? propellant2;
  Thrust? thrustSeaLevel;
  Thrust? thrustVacuum;
  double? thrustToWeight;

  Engines({
    this.number,
    this.type,
    this.version,
    this.layout,
    this.isp,
    this.engineLossMax,
    this.propellant1,
    this.propellant2,
    this.thrustSeaLevel,
    this.thrustVacuum,
    this.thrustToWeight,
  });

  Engines copyWith({
    int? number,
    String? type,
    String? version,
    String? layout,
    Isp? isp,
    int? engineLossMax,
    String? propellant1,
    String? propellant2,
    Thrust? thrustSeaLevel,
    Thrust? thrustVacuum,
    double? thrustToWeight,
  }) =>
      Engines(
        number: number ?? this.number,
        type: type ?? this.type,
        version: version ?? this.version,
        layout: layout ?? this.layout,
        isp: isp ?? this.isp,
        engineLossMax: engineLossMax ?? this.engineLossMax,
        propellant1: propellant1 ?? this.propellant1,
        propellant2: propellant2 ?? this.propellant2,
        thrustSeaLevel: thrustSeaLevel ?? this.thrustSeaLevel,
        thrustVacuum: thrustVacuum ?? this.thrustVacuum,
        thrustToWeight: thrustToWeight ?? this.thrustToWeight,
      );

  factory Engines.fromRawJson(String str) => Engines.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Engines.fromJson(Map<String, dynamic> json) => Engines(
    number: json["number"],
    type: json["type"],
    version: json["version"],
    layout: json["layout"],
    isp: json["isp"] == null ? null : Isp.fromJson(json["isp"]),
    engineLossMax: json["engine_loss_max"],
    propellant1: json["propellant_1"],
    propellant2: json["propellant_2"],
    thrustSeaLevel: json["thrust_sea_level"] == null ? null : Thrust.fromJson(json["thrust_sea_level"]),
    thrustVacuum: json["thrust_vacuum"] == null ? null : Thrust.fromJson(json["thrust_vacuum"]),
    thrustToWeight: json["thrust_to_weight"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "type": type,
    "version": version,
    "layout": layout,
    "isp": isp?.toJson(),
    "engine_loss_max": engineLossMax,
    "propellant_1": propellant1,
    "propellant_2": propellant2,
    "thrust_sea_level": thrustSeaLevel?.toJson(),
    "thrust_vacuum": thrustVacuum?.toJson(),
    "thrust_to_weight": thrustToWeight,
  };
}

class Isp {
  int? seaLevel;
  int? vacuum;

  Isp({
    this.seaLevel,
    this.vacuum,
  });

  Isp copyWith({
    int? seaLevel,
    int? vacuum,
  }) =>
      Isp(
        seaLevel: seaLevel ?? this.seaLevel,
        vacuum: vacuum ?? this.vacuum,
      );

  factory Isp.fromRawJson(String str) => Isp.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Isp.fromJson(Map<String, dynamic> json) => Isp(
    seaLevel: json["sea_level"],
    vacuum: json["vacuum"],
  );

  Map<String, dynamic> toJson() => {
    "sea_level": seaLevel,
    "vacuum": vacuum,
  };
}

class Thrust {
  int? kN;
  int? lbf;

  Thrust({
    this.kN,
    this.lbf,
  });

  Thrust copyWith({
    int? kN,
    int? lbf,
  }) =>
      Thrust(
        kN: kN ?? this.kN,
        lbf: lbf ?? this.lbf,
      );

  factory Thrust.fromRawJson(String str) => Thrust.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Thrust.fromJson(Map<String, dynamic> json) => Thrust(
    kN: json["kN"],
    lbf: json["lbf"],
  );

  Map<String, dynamic> toJson() => {
    "kN": kN,
    "lbf": lbf,
  };
}

class FirstStage {
  bool? reusable;
  int? engines;
  int? fuelAmountTons;
  int? burnTimeSec;
  Thrust? thrustSeaLevel;
  Thrust? thrustVacuum;

  FirstStage({
    this.reusable,
    this.engines,
    this.fuelAmountTons,
    this.burnTimeSec,
    this.thrustSeaLevel,
    this.thrustVacuum,
  });

  FirstStage copyWith({
    bool? reusable,
    int? engines,
    int? fuelAmountTons,
    int? burnTimeSec,
    Thrust? thrustSeaLevel,
    Thrust? thrustVacuum,
  }) =>
      FirstStage(
        reusable: reusable ?? this.reusable,
        engines: engines ?? this.engines,
        fuelAmountTons: fuelAmountTons ?? this.fuelAmountTons,
        burnTimeSec: burnTimeSec ?? this.burnTimeSec,
        thrustSeaLevel: thrustSeaLevel ?? this.thrustSeaLevel,
        thrustVacuum: thrustVacuum ?? this.thrustVacuum,
      );

  factory FirstStage.fromRawJson(String str) => FirstStage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FirstStage.fromJson(Map<String, dynamic> json) => FirstStage(
    reusable: json["reusable"],
    engines: json["engines"],
    fuelAmountTons: json["fuel_amount_tons"],
    burnTimeSec: json["burn_time_sec"],
    thrustSeaLevel: json["thrust_sea_level"] == null ? null : Thrust.fromJson(json["thrust_sea_level"]),
    thrustVacuum: json["thrust_vacuum"] == null ? null : Thrust.fromJson(json["thrust_vacuum"]),
  );

  Map<String, dynamic> toJson() => {
    "reusable": reusable,
    "engines": engines,
    "fuel_amount_tons": fuelAmountTons,
    "burn_time_sec": burnTimeSec,
    "thrust_sea_level": thrustSeaLevel?.toJson(),
    "thrust_vacuum": thrustVacuum?.toJson(),
  };
}

class LandingLegs {
  int? number;
  String? material;

  LandingLegs({
    this.number,
    this.material,
  });

  LandingLegs copyWith({
    int? number,
    String? material,
  }) =>
      LandingLegs(
        number: number ?? this.number,
        material: material ?? this.material,
      );

  factory LandingLegs.fromRawJson(String str) => LandingLegs.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LandingLegs.fromJson(Map<String, dynamic> json) => LandingLegs(
    number: json["number"],
    material: json["material"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "material": material,
  };
}

class Mass {
  int? kg;
  int? lb;

  Mass({
    this.kg,
    this.lb,
  });

  Mass copyWith({
    int? kg,
    int? lb,
  }) =>
      Mass(
        kg: kg ?? this.kg,
        lb: lb ?? this.lb,
      );

  factory Mass.fromRawJson(String str) => Mass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Mass.fromJson(Map<String, dynamic> json) => Mass(
    kg: json["kg"],
    lb: json["lb"],
  );

  Map<String, dynamic> toJson() => {
    "kg": kg,
    "lb": lb,
  };
}

class PayloadWeight {
  String? id;
  String? name;
  int? kg;
  int? lb;

  PayloadWeight({
    this.id,
    this.name,
    this.kg,
    this.lb,
  });

  PayloadWeight copyWith({
    String? id,
    String? name,
    int? kg,
    int? lb,
  }) =>
      PayloadWeight(
        id: id ?? this.id,
        name: name ?? this.name,
        kg: kg ?? this.kg,
        lb: lb ?? this.lb,
      );

  factory PayloadWeight.fromRawJson(String str) => PayloadWeight.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PayloadWeight.fromJson(Map<String, dynamic> json) => PayloadWeight(
    id: json["id"],
    name: json["name"],
    kg: json["kg"],
    lb: json["lb"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "kg": kg,
    "lb": lb,
  };
}

class SecondStage {
  bool? reusable;
  int? engines;
  int? fuelAmountTons;
  int? burnTimeSec;
  Thrust? thrust;
  Payloads? payloads;

  SecondStage({
    this.reusable,
    this.engines,
    this.fuelAmountTons,
    this.burnTimeSec,
    this.thrust,
    this.payloads,
  });

  SecondStage copyWith({
    bool? reusable,
    int? engines,
    int? fuelAmountTons,
    int? burnTimeSec,
    Thrust? thrust,
    Payloads? payloads,
  }) =>
      SecondStage(
        reusable: reusable ?? this.reusable,
        engines: engines ?? this.engines,
        fuelAmountTons: fuelAmountTons ?? this.fuelAmountTons,
        burnTimeSec: burnTimeSec ?? this.burnTimeSec,
        thrust: thrust ?? this.thrust,
        payloads: payloads ?? this.payloads,
      );

  factory SecondStage.fromRawJson(String str) => SecondStage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SecondStage.fromJson(Map<String, dynamic> json) => SecondStage(
    reusable: json["reusable"],
    engines: json["engines"],
    fuelAmountTons: json["fuel_amount_tons"],
    burnTimeSec: json["burn_time_sec"],
    thrust: json["thrust"] == null ? null : Thrust.fromJson(json["thrust"]),
    payloads: json["payloads"] == null ? null : Payloads.fromJson(json["payloads"]),
  );

  Map<String, dynamic> toJson() => {
    "reusable": reusable,
    "engines": engines,
    "fuel_amount_tons": fuelAmountTons,
    "burn_time_sec": burnTimeSec,
    "thrust": thrust?.toJson(),
    "payloads": payloads?.toJson(),
  };
}

class Payloads {
  String? option1;
  String? option2;
  CompositeFairing? compositeFairing;

  Payloads({
    this.option1,
    this.option2,
    this.compositeFairing,
  });

  Payloads copyWith({
    String? option1,
    String? option2,
    CompositeFairing? compositeFairing,
  }) =>
      Payloads(
        option1: option1 ?? this.option1,
        option2: option2 ?? this.option2,
        compositeFairing: compositeFairing ?? this.compositeFairing,
      );

  factory Payloads.fromRawJson(String str) => Payloads.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Payloads.fromJson(Map<String, dynamic> json) => Payloads(
    option1: json["option_1"],
    option2: json["option_2"],
    compositeFairing: json["composite_fairing"] == null ? null : CompositeFairing.fromJson(json["composite_fairing"]),
  );

  Map<String, dynamic> toJson() => {
    "option_1": option1,
    "option_2": option2,
    "composite_fairing": compositeFairing?.toJson(),
  };
}

class CompositeFairing {
  Diameter? height;
  Diameter? diameter;

  CompositeFairing({
    this.height,
    this.diameter,
  });

  CompositeFairing copyWith({
    Diameter? height,
    Diameter? diameter,
  }) =>
      CompositeFairing(
        height: height ?? this.height,
        diameter: diameter ?? this.diameter,
      );

  factory CompositeFairing.fromRawJson(String str) => CompositeFairing.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CompositeFairing.fromJson(Map<String, dynamic> json) => CompositeFairing(
    height: json["height"] == null ? null : Diameter.fromJson(json["height"]),
    diameter: json["diameter"] == null ? null : Diameter.fromJson(json["diameter"]),
  );

  Map<String, dynamic> toJson() => {
    "height": height?.toJson(),
    "diameter": diameter?.toJson(),
  };
}
