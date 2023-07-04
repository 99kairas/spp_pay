// To parse this JSON data, do
//
//     final adminAllPembayaranResponse = adminAllPembayaranResponseFromJson(jsonString);

import 'dart:convert';

AdminAllPembayaranResponse adminAllPembayaranResponseFromJson(String str) => AdminAllPembayaranResponse.fromJson(json.decode(str));

String adminAllPembayaranResponseToJson(AdminAllPembayaranResponse data) => json.encode(data.toJson());

class AdminAllPembayaranResponse {
    String? message;
    List<AllPembayaran>? data;

    AdminAllPembayaranResponse({
        this.message,
        this.data,
    });

    factory AdminAllPembayaranResponse.fromJson(Map<String, dynamic> json) => AdminAllPembayaranResponse(
        message: json["message"],
        data: json["data"] == null ? [] : List<AllPembayaran>.from(json["data"]!.map((x) => AllPembayaran.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class AllPembayaran {
    String? idPembayaran;
    String? idSpp;
    String? noIndukSiswa;
    dynamic tanggalBayar;
    String? jumlahBayar;
    String? fotoPembayaran;
    bool? status;
    Siswa? siswa;
    Spp? spp;

    AllPembayaran({
        this.idPembayaran,
        this.idSpp,
        this.noIndukSiswa,
        this.tanggalBayar,
        this.jumlahBayar,
        this.fotoPembayaran,
        this.status,
        this.siswa,
        this.spp,
    });

    factory AllPembayaran.fromJson(Map<String, dynamic> json) => AllPembayaran(
        idPembayaran: json["id_pembayaran"],
        idSpp: json["id_spp"],
        noIndukSiswa: json["no_induk_siswa"],
        tanggalBayar: json["tanggal_bayar"],
        jumlahBayar: json["jumlah_bayar"],
        fotoPembayaran: json["foto_pembayaran"],
        status: json["status"],
        siswa: json["siswa"] == null ? null : Siswa.fromJson(json["siswa"]),
        spp: json["spp"] == null ? null : Spp.fromJson(json["spp"]),
    );

    Map<String, dynamic> toJson() => {
        "id_pembayaran": idPembayaran,
        "id_spp": idSpp,
        "no_induk_siswa": noIndukSiswa,
        "tanggal_bayar": tanggalBayar,
        "jumlah_bayar": jumlahBayar,
        "foto_pembayaran": fotoPembayaran,
        "status": status,
        "siswa": siswa?.toJson(),
        "spp": spp?.toJson(),
    };
}

class Siswa {
    String? namaSiswa;
    String? kelas;

    Siswa({
        this.namaSiswa,
        this.kelas,
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
    String? tahun;
    String? bulan;
    String? jumlah;

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
