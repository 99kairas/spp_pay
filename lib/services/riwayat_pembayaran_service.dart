import 'package:dio/dio.dart';
import 'package:spp_pay/models/pembayaran_response.dart';
import 'package:spp_pay/shared/shared_methods.dart';

class RiwayatPembayaranService {
  Dio dio = Dio();

  Future<PembayaranResponse> getPembayaran() async {
    final token = await SharedPref.getToken();
    try {
      final response = await dio.get(
        '${APIConstant.baseUrl}/pembayaran',
        options: Options(
          headers: APIConstant.auth('$token'),
        ),
      );
      return PembayaranResponse.fromJson(response.data);
    } on DioException catch (e) {
      return PembayaranResponse.fromJson(e.response?.data);
    }
  }
}
