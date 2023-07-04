import 'package:dio/dio.dart';
import 'package:spp_pay/models/detail_payment_response.dart';
import 'package:spp_pay/shared/shared_methods.dart';

class DetailPaymentService {
  Dio dio = Dio();

  Future<DetailPaymentResponse> getDetailPayment({String? idPembayaran}) async {
    final token = await SharedPref.getToken();

    try {
      final response = await dio.get(
        '${APIConstant.baseUrl}/pembayaran/details?id_pembayaran=$idPembayaran',
        options: Options(
          headers: {
            "authorization": '$token',
          },
        ),
      );

      print(response.data);

      return DetailPaymentResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to Get Data $e');
    }
  }
}
