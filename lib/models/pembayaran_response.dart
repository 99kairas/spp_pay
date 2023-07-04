// To parse this JSON data, do
//
//     final pembayaranResponse = pembayaranResponseFromJson(jsonString);

import 'dart:convert';

PembayaranResponse pembayaranResponseFromJson(String str) =>
    PembayaranResponse.fromJson(json.decode(str));

String pembayaranResponseToJson(PembayaranResponse data) =>
    json.encode(data.toJson());

class PembayaranResponse {
  String message;
  List<Pembayaran> data;

  PembayaranResponse({
    required this.message,
    required this.data,
  });

  factory PembayaranResponse.fromJson(Map<String, dynamic> json) =>
      PembayaranResponse(
        message: json["message"],
        data: List<Pembayaran>.from(
            json["data"].map((x) => Pembayaran.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Pembayaran {
  String idPembayaran;
  String idSpp;
  String noIndukSiswa;
  dynamic tanggalBayar;
  String jumlahBayar;
  String fotoPembayaran;
  bool status;
  Siswa siswa;
  Spp spp;

  Pembayaran({
    required this.idPembayaran,
    required this.idSpp,
    required this.noIndukSiswa,
    required this.tanggalBayar,
    required this.jumlahBayar,
    required this.fotoPembayaran,
    required this.status,
    required this.siswa,
    required this.spp,
  });

  factory Pembayaran.fromJson(Map<String, dynamic> json) => Pembayaran(
        idPembayaran: json["id_pembayaran"],
        idSpp: json["id_spp"],
        noIndukSiswa: json["no_induk_siswa"],
        tanggalBayar: json["tanggal_bayar"],
        jumlahBayar: json["jumlah_bayar"],
        fotoPembayaran: json["foto_pembayaran"],
        status: json["status"],
        siswa: Siswa.fromJson(json["siswa"]),
        spp: Spp.fromJson(json["spp"]),
      );

  Map<String, dynamic> toJson() => {
        "id_pembayaran": idPembayaran,
        "id_spp": idSpp,
        "no_induk_siswa": noIndukSiswa,
        "tanggal_bayar": tanggalBayar,
        "jumlah_bayar": jumlahBayar,
        "foto_pembayaran": fotoPembayaran,
        "status": status,
        "siswa": siswa.toJson(),
        "spp": spp.toJson(),
      };
}

class Siswa {
  String namaSiswa;
  String kelas;

  Siswa({
    required this.namaSiswa,
    required this.kelas,
  });

  factory Siswa.fromJson(Map<String, dynamic> json) => Siswa(
        namaSiswa: json["nama_siswa"],
        kelas: json["kelas"],
      );

  Map<String, dynamic> toJson() => {
        "nama_siswa": namaSiswa,
        "kelas": kelas,
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
