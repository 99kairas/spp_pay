// To parse this JSON data, do
//
//     final userInformationResponse = userInformationResponseFromJson(jsonString);

import 'dart:convert';

UserInformationResponse userInformationResponseFromJson(String str) =>
    UserInformationResponse.fromJson(json.decode(str));

String userInformationResponseToJson(UserInformationResponse data) =>
    json.encode(data.toJson());

class UserInformationResponse {
  final String? message;
  final UserInformation? data;

  UserInformationResponse({
    this.message,
    this.data,
  });

  factory UserInformationResponse.fromJson(Map<String, dynamic> json) =>
      UserInformationResponse(
        message: json["message"],
        data: json["data"] == null
            ? null
            : UserInformation.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
      };
}

class UserInformation {
  final String? noIndukSiswa;
  final String? namaSiswa;
  final String? kelas;
  final String? alamat;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserInformation({
    this.noIndukSiswa,
    this.namaSiswa,
    this.kelas,
    this.alamat,
    this.createdAt,
    this.updatedAt,
  });

  factory UserInformation.fromJson(Map<String, dynamic> json) =>
      UserInformation(
        noIndukSiswa: json["noIndukSiswa"],
        namaSiswa: json["namaSiswa"],
        kelas: json["kelas"],
        alamat: json["alamat"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "noIndukSiswa": noIndukSiswa,
        "namaSiswa": namaSiswa,
        "kelas": kelas,
        "alamat": alamat,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
