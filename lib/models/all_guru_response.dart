// To parse this JSON data, do
//
//     final allGuruResponse = allGuruResponseFromJson(jsonString);

import 'dart:convert';

AllGuruResponse allGuruResponseFromJson(String str) => AllGuruResponse.fromJson(json.decode(str));

String allGuruResponseToJson(AllGuruResponse data) => json.encode(data.toJson());

class AllGuruResponse {
    String message;
    List<AllGuru> data;

    AllGuruResponse({
        required this.message,
        required this.data,
    });

    factory AllGuruResponse.fromJson(Map<String, dynamic> json) => AllGuruResponse(
        message: json["message"],
        data: List<AllGuru>.from(json["data"].map((x) => AllGuru.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class AllGuru {
    String nip;
    String name;
    Pendidikan pendidikan;
    MataPelajaran mataPelajaran;
    JenisKelamin jenisKelamin;
    String fotoGuru;
    DateTime createdAt;
    DateTime updatedAt;

    AllGuru({
        required this.nip,
        required this.name,
        required this.pendidikan,
        required this.mataPelajaran,
        required this.jenisKelamin,
        required this.fotoGuru,
        required this.createdAt,
        required this.updatedAt,
    });

    factory AllGuru.fromJson(Map<String, dynamic> json) => AllGuru(
        nip: json["nip"],
        name: json["name"],
        pendidikan: pendidikanValues.map[json["pendidikan"]]!,
        mataPelajaran: mataPelajaranValues.map[json["mata_pelajaran"]]!,
        jenisKelamin: jenisKelaminValues.map[json["jenis_kelamin"]]!,
        fotoGuru: json["foto_guru"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "nip": nip,
        "name": name,
        "pendidikan": pendidikanValues.reverse[pendidikan],
        "mata_pelajaran": mataPelajaranValues.reverse[mataPelajaran],
        "jenis_kelamin": jenisKelaminValues.reverse[jenisKelamin],
        "foto_guru": fotoGuru,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

enum JenisKelamin { PEREMPUAN, LAKI_LAKI }

final jenisKelaminValues = EnumValues({
    "Laki - Laki": JenisKelamin.LAKI_LAKI,
    "Perempuan": JenisKelamin.PEREMPUAN
});

enum MataPelajaran { GURU_KELAS, GURU_AGAMA_ISLAM, GURU_OLAHRAGA }

final mataPelajaranValues = EnumValues({
    "Guru Agama Islam": MataPelajaran.GURU_AGAMA_ISLAM,
    "Guru Kelas": MataPelajaran.GURU_KELAS,
    "Guru Olahraga": MataPelajaran.GURU_OLAHRAGA
});

enum Pendidikan { S1 }

final pendidikanValues = EnumValues({
    "S1": Pendidikan.S1
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
