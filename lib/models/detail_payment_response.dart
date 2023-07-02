// To parse this JSON data, do
//
//     final detailPaymentResponse = detailPaymentResponseFromJson(jsonString);

import 'dart:convert';

DetailPaymentResponse detailPaymentResponseFromJson(String str) => DetailPaymentResponse.fromJson(json.decode(str));

String detailPaymentResponseToJson(DetailPaymentResponse data) => json.encode(data.toJson());

class DetailPaymentResponse {
    final String? message;
    final DetailPayment? data;

    DetailPaymentResponse({
        this.message,
        this.data,
    });

    factory DetailPaymentResponse.fromJson(Map<String, dynamic> json) => DetailPaymentResponse(
        message: json["message"],
        data: json["data"] == null ? null : DetailPayment.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
    };
}

class DetailPayment {
    final int? idPembayaran;
    final int? idSpp;
    final String? noIndukSiswa;
    final dynamic tanggalBayar;
    final String? jumlahBayar;
    final bool? status;
    final Image? image;
    final Siswa? siswa;
    final Spp? spp;

    DetailPayment({
        this.idPembayaran,
        this.idSpp,
        this.noIndukSiswa,
        this.tanggalBayar,
        this.jumlahBayar,
        this.status,
        this.image,
        this.siswa,
        this.spp,
    });

    factory DetailPayment.fromJson(Map<String, dynamic> json) => DetailPayment(
        idPembayaran: json["idPembayaran"],
        idSpp: json["idSpp"],
        noIndukSiswa: json["noIndukSiswa"],
        tanggalBayar: json["tanggalBayar"],
        jumlahBayar: json["jumlahBayar"],
        status: json["status"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
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
        "image": image?.toJson(),
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
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
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
