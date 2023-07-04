// To parse this JSON data, do
//
//     final userInformationResponse = userInformationResponseFromJson(jsonString);

import 'dart:convert';

UserInformationResponse userInformationResponseFromJson(String str) => UserInformationResponse.fromJson(json.decode(str));

String userInformationResponseToJson(UserInformationResponse data) => json.encode(data.toJson());

class UserInformationResponse {
    String message;
    UserInformation data;

    UserInformationResponse({
        required this.message,
        required this.data,
    });

    factory UserInformationResponse.fromJson(Map<String, dynamic> json) => UserInformationResponse(
        message: json["message"],
        data: UserInformation.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class UserInformation {
    String noIndukSiswa;
    String namaSiswa;
    String password;
    String kelas;
    String alamat;
    String fotoProfil;
    DateTime createdAt;
    DateTime updatedAt;

    UserInformation({
        required this.noIndukSiswa,
        required this.namaSiswa,
        required this.password,
        required this.kelas,
        required this.alamat,
        required this.fotoProfil,
        required this.createdAt,
        required this.updatedAt,
    });

    factory UserInformation.fromJson(Map<String, dynamic> json) => UserInformation(
        noIndukSiswa: json["no_induk_siswa"],
        namaSiswa: json["nama_siswa"],
        password: json["password"],
        kelas: json["kelas"],
        alamat: json["alamat"],
        fotoProfil: json["foto_profil"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "no_induk_siswa": noIndukSiswa,
        "nama_siswa": namaSiswa,
        "password": password,
        "kelas": kelas,
        "alamat": alamat,
        "foto_profil": fotoProfil,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
