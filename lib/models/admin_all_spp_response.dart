// To parse this JSON data, do
//
//     final adminAllSppResponse = adminAllSppResponseFromJson(jsonString);

import 'dart:convert';

AdminAllSppResponse adminAllSppResponseFromJson(String str) =>
    AdminAllSppResponse.fromJson(json.decode(str));

String adminAllSppResponseToJson(AdminAllSppResponse data) =>
    json.encode(data.toJson());

class AdminAllSppResponse {
  String? message;
  List<AllSpp>? data;

  AdminAllSppResponse({
    this.message,
    this.data,
  });

  factory AdminAllSppResponse.fromJson(Map<String, dynamic> json) =>
      AdminAllSppResponse(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<AllSpp>.from(json["data"]!.map((x) => AllSpp.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class AllSpp {
  String? idSpp;
  String? tahun;
  String? bulan;
  String? jumlah;
  DateTime? createdAt;
  DateTime? updatedAt;

  AllSpp({
    this.idSpp,
    this.tahun,
    this.bulan,
    this.jumlah,
    this.createdAt,
    this.updatedAt,
  });

  factory AllSpp.fromJson(Map<String, dynamic> json) => AllSpp(
        idSpp: json["id_spp"],
        tahun: json["tahun"],
        bulan: json["bulan"],
        jumlah: json["jumlah"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id_spp": idSpp,
        "tahun": tahun,
        "bulan": bulan,
        "jumlah": jumlah,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
