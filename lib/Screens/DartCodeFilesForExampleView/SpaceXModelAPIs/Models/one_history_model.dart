
// To parse this JSON data, do
//
//     final oneHistoryModel = oneHistoryModelFromJson(jsonString);

import 'dart:convert';

class OneHistoryModel {
  int? id;
  String? title;
  DateTime? eventDateUtc;
  int? eventDateUnix;
  int? flightNumber;
  String? details;
  Links? links;

  OneHistoryModel({
    this.id,
    this.title,
    this.eventDateUtc,
    this.eventDateUnix,
    this.flightNumber,
    this.details,
    this.links,
  });

  OneHistoryModel copyWith({
    int? id,
    String? title,
    DateTime? eventDateUtc,
    int? eventDateUnix,
    int? flightNumber,
    String? details,
    Links? links,
  }) =>
      OneHistoryModel(
        id: id ?? this.id,
        title: title ?? this.title,
        eventDateUtc: eventDateUtc ?? this.eventDateUtc,
        eventDateUnix: eventDateUnix ?? this.eventDateUnix,
        flightNumber: flightNumber ?? this.flightNumber,
        details: details ?? this.details,
        links: links ?? this.links,
      );

  factory OneHistoryModel.fromRawJson(String str) =>
      OneHistoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OneHistoryModel.fromJson(Map<String, dynamic> json) =>
      OneHistoryModel(
        id: json["id"],
        title: json["title"],
        eventDateUtc: json["event_date_utc"] == null
            ? null
            : DateTime.parse(json["event_date_utc"]),
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
  dynamic reddit;
  String? article;
  String? wikipedia;

  Links({
    this.reddit,
    this.article,
    this.wikipedia,
  });

  Links copyWith({
    dynamic reddit,
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
