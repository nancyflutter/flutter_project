// To parse this JSON data, do
//
//     final allHistoryModel = allHistoryModelFromJson(jsonString);

import 'dart:convert';

class AllHistoryModel {
  int? id;
  String? title;
  DateTime? eventDateUtc;
  int? eventDateUnix;
  int? flightNumber;
  String? details;
  Links? links;

  AllHistoryModel({
    this.id,
    this.title,
    this.eventDateUtc,
    this.eventDateUnix,
    this.flightNumber,
    this.details,
    this.links,
  });

  AllHistoryModel copyWith({
    int? id,
    String? title,
    DateTime? eventDateUtc,
    int? eventDateUnix,
    int? flightNumber,
    String? details,
    Links? links,
  }) =>
      AllHistoryModel(
        id: id ?? this.id,
        title: title ?? this.title,
        eventDateUtc: eventDateUtc ?? this.eventDateUtc,
        eventDateUnix: eventDateUnix ?? this.eventDateUnix,
        flightNumber: flightNumber ?? this.flightNumber,
        details: details ?? this.details,
        links: links ?? this.links,
      );

  factory AllHistoryModel.fromRawJson(String str) => AllHistoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllHistoryModel.fromJson(Map<String, dynamic> json) => AllHistoryModel(
    id: json["id"],
    title: json["title"],
    eventDateUtc: json["event_date_utc"] == null ? null : DateTime.parse(json["event_date_utc"]),
    eventDateUnix: json["event_date_unix"],
    flightNumber: json["flight_number"],
    details: json["details"],
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "event_date_utc": eventDateUtc?.toIso8601String(),
    "event_date_unix": eventDateUnix,
    "flight_number": flightNumber,
    "details": details,
    "links": links?.toJson(),
  };
}

class Links {
  String? reddit;
  String? article;
  String? wikipedia;

  Links({
    this.reddit,
    this.article,
    this.wikipedia,
  });

  Links copyWith({
    String? reddit,
    String? article,
    String? wikipedia,
  }) =>
      Links(
        reddit: reddit ?? this.reddit,
        article: article ?? this.article,
        wikipedia: wikipedia ?? this.wikipedia,
      );

  factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    reddit: json["reddit"],
    article: json["article"],
    wikipedia: json["wikipedia"],
  );

  Map<String, dynamic> toJson() => {
    "reddit": reddit,
    "article": article,
    "wikipedia": wikipedia,
  };
}
