// To parse this JSON data, do
//
//     final apiInfoModel = apiInfoModelFromJson(jsonString);

import 'dart:convert';

class ApiInfoModel {
  String? projectName;
  String? version;
  String? projectLink;
  String? docs;
  String? organization;
  String? organizationLink;
  String? description;

  ApiInfoModel({
    this.projectName,
    this.version,
    this.projectLink,
    this.docs,
    this.organization,
    this.organizationLink,
    this.description,
  });

  ApiInfoModel copyWith({
    String? projectName,
    String? version,
    String? projectLink,
    String? docs,
    String? organization,
    String? organizationLink,
    String? description,
  }) =>
      ApiInfoModel(
        projectName: projectName ?? this.projectName,
        version: version ?? this.version,
        projectLink: projectLink ?? this.projectLink,
        docs: docs ?? this.docs,
        organization: organization ?? this.organization,
        organizationLink: organizationLink ?? this.organizationLink,
        description: description ?? this.description,
      );

  factory ApiInfoModel.fromRawJson(String str) => ApiInfoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiInfoModel.fromJson(Map<String, dynamic> json) => ApiInfoModel(
    projectName: json["project_name"],
    version: json["version"],
    projectLink: json["project_link"],
    docs: json["docs"],
    organization: json["organization"],
    organizationLink: json["organization_link"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "project_name": projectName,
    "version": version,
    "project_link": projectLink,
    "docs": docs,
    "organization": organization,
    "organization_link": organizationLink,
    "description": description,
  };
}
