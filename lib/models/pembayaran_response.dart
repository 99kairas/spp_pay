// To parse this JSON data, do
//
//     final pembayaranResponse = pembayaranResponseFromJson(jsonString);

import 'dart:convert';

PembayaranResponse pembayaranResponseFromJson(String str) =>
    PembayaranResponse.fromJson(json.decode(str));

String pembayaranResponseToJson(PembayaranResponse data) =>
    json.encode(data.toJson());

class PembayaranResponse {
  final String? message;
  final List<Pembayaran>? data;

  PembayaranResponse({
    this.message,
    this.data,
  });

  factory PembayaranResponse.fromJson(Map<String, dynamic> json) =>
      PembayaranResponse(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Pembayaran>.from(
                json["data"]!.map((x) => Pembayaran.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Pembayaran {
  final int? idPembayaran;
  final int? idSpp;
  final String? noIndukSiswa;
  final dynamic tanggalBayar;
  final String? jumlahBayar;
  final bool? status;
  final List<Image>? images;
  final Siswa? siswa;
  final Spp? spp;

  Pembayaran({
    this.idPembayaran,
    this.idSpp,
    this.noIndukSiswa,
    this.tanggalBayar,
    this.jumlahBayar,
    this.status,
    this.images,
    this.siswa,
    this.spp,
  });

  factory Pembayaran.fromJson(Map<String, dynamic> json) => Pembayaran(
        idPembayaran: json["idPembayaran"],
        idSpp: json["idSpp"],
        noIndukSiswa: json["noIndukSiswa"],
        tanggalBayar: json["tanggalBayar"],
        jumlahBayar: json["jumlahBayar"],
        status: json["status"],
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        siswa: json["siswa"] == null ? null : Siswa.fromJson(json["siswa"]),
        spp: json["spp"] == null ? null : Spp.fromJson(json["spp"]),
      );

  Map<String, dynamic> toJson() => {
        "idPembayaran": idPembayaran,
        "idSpp": idSpp,
        "noIndukSiswa": noIndukSiswa,
        "tanggalBayar": tanggalBayar,
        "jumlahBayar": jumlahBayar,
        "status": status,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "siswa": siswa?.toJson(),
        "spp": spp?.toJson(),
      };
}

class Image {
  final String? file;
  final DateTime? createdAt;

  Image({
    this.file,
    this.createdAt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        file: json["file"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "file": file,
        "createdAt": createdAt?.toIso8601String(),
      };
}

class Siswa {
  final String? namaSiswa;
  final String? kelas;
  final String? alamat;

  Siswa({
    this.namaSiswa,
    this.kelas,
    this.alamat,
  });

  factory Siswa.fromJson(Map<String, dynamic> json) => Siswa(
        namaSiswa: json["namaSiswa"],
        kelas: json["kelas"],
        alamat: json["alamat"],
      );

  Map<String, dynamic> toJson() => {
        "namaSiswa": namaSiswa,
        "kelas": kelas,
        "alamat": alamat,
      };
}

class Spp {
  final String? tahun;
  final String? bulan;
  final String? jumlah;

  Spp({
    this.tahun,
    this.bulan,
    this.jumlah,
  });

  factory Spp.fromJson(Map<String, dynamic> json) => Spp(
        tahun: json["tahun"],
        bulan: json["bulan"],
        jumlah: json["jumlah"],
      );

  Map<String, dynamic> toJson() => {
        "tahun": tahun,
        "bulan": bulan,
        "jumlah": jumlah,
      };
}
