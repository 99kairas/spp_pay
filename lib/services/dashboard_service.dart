import 'package:dio/dio.dart';
import 'package:spp_pay/models/pembayaran_response.dart';
import 'package:spp_pay/models/user_information_respnse.dart';
import 'package:spp_pay/shared/shared_methods.dart';

class DashboardService {
  Dio dio = Dio();

  Future<UserInformationResponse> getUserInfo() async {
    final token = await SharedPref.getToken();
    try {
      final response = await dio.get(
        '${APIConstant.baseUrl}/user/details',
        options: Options(
          headers: {
            "authorization": '$token',
          },
        ),
      );
      return UserInformationResponse.fromJson(response.data);
    } on DioException catch (e) {
      return UserInformationResponse.fromJson(e.response?.data);
    }
  }

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
