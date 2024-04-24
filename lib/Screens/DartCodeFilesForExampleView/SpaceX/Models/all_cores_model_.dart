// To parse this JSON data, do
//
//     final allCoresModel = allCoresModelFromJson(jsonString);

class AllCoresModel {
  String? coreSerial;
  dynamic block;
  String? status;
  String? originalLaunch;
  int? originalLaunchUnix;
  List<Missions>? missions;
  int? reuseCount;
  int? rtlsAttempts;
  int? rtlsLandings;
  int? asdsAttempts;
  int? asdsLandings;
  bool? waterLanding;
  String? details;

  AllCoresModel(
      {this.coreSerial,
        this.block,
        this.status,
        this.originalLaunch,
        this.originalLaunchUnix,
        this.missions,
        this.reuseCount,
        this.rtlsAttempts,
        this.rtlsLandings,
        this.asdsAttempts,
        this.asdsLandings,
        this.waterLanding,
        this.details});

  AllCoresModel.fromJson(Map<String, dynamic> json) {
    coreSerial = json['core_serial'];
    block = json['block'];
    status = json['status'];
    originalLaunch = json['original_launch'];
    originalLaunchUnix = json['original_launch_unix'];
    if (json['missions'] != null) {
      missions = <Missions>[];
      json['missions'].forEach((v) {
        missions!.add(new Missions.fromJson(v));
      });
    }
    reuseCount = json['reuse_count'];
    rtlsAttempts = json['rtls_attempts'];
    rtlsLandings = json['rtls_landings'];
    asdsAttempts = json['asds_attempts'];
    asdsLandings = json['asds_landings'];
    waterLanding = json['water_landing'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['core_serial'] = this.coreSerial;
    data['block'] = this.block;
    data['status'] = this.status;
    data['original_launch'] = this.originalLaunch;
    data['original_launch_unix'] = this.originalLaunchUnix;
    if (this.missions != null) {
      data['missions'] = this.missions!.map((v) => v.toJson()).toList();
    }
    data['reuse_count'] = this.reuseCount;
    data['rtls_attempts'] = this.rtlsAttempts;
    data['rtls_landings'] = this.rtlsLandings;
    data['asds_attempts'] = this.asdsAttempts;
    data['asds_landings'] = this.asdsLandings;
    data['water_landing'] = this.waterLanding;
    data['details'] = this.details;
    return data;
  }
}

class Missions {
  String? name;
  int? flight;

  Missions({this.name, this.flight});

  Missions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    flight = json['flight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['flight'] = this.flight;
    return data;
  }
}
