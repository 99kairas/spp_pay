import 'package:dio/dio.dart';
import 'package:spp_pay/models/admin_all_pembayaran_response.dart';
import 'package:spp_pay/models/admin_all_spp_response.dart';
import 'package:spp_pay/shared/shared_methods.dart';

class AdminDashboardService {
  Dio dio = Dio();
  Future<AdminAllPembayaranResponse> getAllPembayaran() async {
    final token = await SharedPref.getToken();

    try {
      final response = await dio.get(
        '${APIConstant.baseUrl}/admin/pembayaran/show/all',
        options: Options(
          headers: APIConstant.auth('$token'),
        ),
      );
      return AdminAllPembayaranResponse.fromJson(response.data);
    } on DioException catch (e) {
      return AdminAllPembayaranResponse.fromJson(e.response?.data);
    }
  }

  Future<AdminAllSppResponse> getAllSpp() async {
    final token = await SharedPref.getToken();

    try {
      final response = await dio.get(
        '${APIConstant.baseUrl}/spp',
        options: Options(
          headers: APIConstant.auth('$token'),
        ),
      );
      return AdminAllSppResponse.fromJson(response.data);
    } on DioException catch (e) {
      return AdminAllSppResponse.fromJson(e.response?.data);
    }
  }

  Future<bool> addSpp({
    required String? tahun,
    required String? bulan,
    required double? jumlah,
  }) async {
    final token = await SharedPref.getToken();

    try {
      final response = await dio.post(
        '${APIConstant.baseUrl}/spp',
        data: {
          'tahun': tahun,
          'bulan': bulan,
          'jumlah': jumlah,
        },
        options: Options(
          headers: APIConstant.auth('$token'),
        ),
      );
      response.data;
      return true;
    } on DioException catch (e) {
      print(e.response?.data);
      return false;
    }
  }

  Future<bool> addAllPembayaran({
    String? idSpp,
  }) async {
    final token = await SharedPref.getToken();

    try {
      final response = await dio.post(
        '${APIConstant.baseUrl}/admin/pembayaran/create/all?id_spp=$idSpp',
        data: {
          'foto_pembayaran': "",
          'jumlah_bayar': 0,
          'tanggal_bayar': '${DateTime.now()}',
          'status': 0,
        },
        options: Options(
          headers: APIConstant.auth('$token'),
        ),
      );
      print('service ${response.data}');
      return true;
    } on DioException catch (e) {
      print('error service ${e.response?.data}');
      return false;
    }
  }

  Future<bool> pembayaranByNIS({
    String? idSpp,
    String? noIndukSiswa,
  }) async {
    final token = await SharedPref.getToken();

    try {
      final response = await dio.post(
        '${APIConstant.baseUrl}/admin/pembayaran/create?no_induk_siswa=$noIndukSiswa&id_spp=$idSpp',
        data: {
          'foto_pembayaran': "",
          'jumlah_bayar': 0,
          'tanggal_bayar': '${DateTime.now()}',
          'status': 0,
        },
        options: Options(
          headers: APIConstant.auth('$token'),
        ),
      );
      print('service ${response.data}');
      return true;
    } on DioException catch (e) {
      print('error service ${e.response?.data}');
      return false;
    }
  }
}
