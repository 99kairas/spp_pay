import 'package:dio/dio.dart';
import 'package:spp_pay/models/admin_all_pembayaran_response.dart';
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
}
