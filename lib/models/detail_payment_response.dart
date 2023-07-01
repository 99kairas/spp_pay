// To parse this JSON data, do
//
//     final detailPaymentResponse = detailPaymentResponseFromJson(jsonString);

import 'dart:convert';

DetailPaymentResponse detailPaymentResponseFromJson(String str) =>
    DetailPaymentResponse.fromJson(json.decode(str));

String detailPaymentResponseToJson(DetailPaymentResponse data) =>
    json.encode(data.toJson());

class DetailPaymentResponse {
  String message;
  DetailPayment data;

  DetailPaymentResponse({
    required this.message,
    required this.data,
  });

  factory DetailPaymentResponse.fromJson(Map<String, dynamic> json) =>
      DetailPaymentResponse(
        message: json["message"],
        data: DetailPayment.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class DetailPayment {
  int idPembayaran;
  int idSpp;
  String noIndukSiswa;
  dynamic tanggalBayar;
  String jumlahBayar;
  bool status;
  List<Image> images;
  Siswa siswa;
  Spp spp;

  DetailPayment({
    required this.idPembayaran,
    required this.idSpp,
    required this.noIndukSiswa,
    this.tanggalBayar,
    required this.jumlahBayar,
    required this.status,
    required this.images,
    required this.siswa,
    required this.spp,
  });

  factory DetailPayment.fromJson(Map<String, dynamic> json) => DetailPayment(
        idPembayaran: json["idPembayaran"],
        idSpp: json["idSpp"],
        noIndukSiswa: json["noIndukSiswa"],
        tanggalBayar: json["tanggalBayar"],
        jumlahBayar: json["jumlahBayar"],
        status: json["status"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        siswa: Siswa.fromJson(json["siswa"]),
        spp: Spp.fromJson(json["spp"]),
      );

  Map<String, dynamic> toJson() => {
        "idPembayaran": idPembayaran,
        "idSpp": idSpp,
        "noIndukSiswa": noIndukSiswa,
        "tanggalBayar": tanggalBayar,
        "jumlahBayar": jumlahBayar,
        "status": status,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "siswa": siswa.toJson(),
        "spp": spp.toJson(),
      };
}

class Image {
  String file;
  DateTime createdAt;

  Image({
    required this.file,
    required this.createdAt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        file: json["file"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "file": file,
        "createdAt": createdAt.toIso8601String(),
      };
}

class Siswa {
  String namaSiswa;
  String kelas;
  String alamat;

  Siswa({
    required this.namaSiswa,
    required this.kelas,
    required this.alamat,
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
  String tahun;
  String bulan;
  String jumlah;

  Spp({
    required this.tahun,
    required this.bulan,
    required this.jumlah,
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
