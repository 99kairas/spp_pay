import 'package:flutter/material.dart';
import 'package:spp_pay/services/detail_payment_service.dart';
import 'package:spp_pay/services/metode_pembayaran_service.dart';
import 'package:spp_pay/shared/shared_methods.dart';
import 'package:spp_pay/shared/theme.dart';

class MetodePembayaranViewModel with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _image;
  String? get image => _image;

  uploadImage({
    required BuildContext context,
    String? idPembayaran,
  }) async {
    _isLoading = true;
    final result =
        await MetodePembayaranService().uploadImage(idPembayaran: idPembayaran);
    if (result == true) {
      // ignore: use_build_context_synchronously
      scaffoldMessenger(
        context: context,
        title: 'Berhasil Upload Image',
        color: greenColor,
        result: result,
      );
          await Future.delayed(const Duration(seconds: 1));

    } else {
      // ignore: use_build_context_synchronously
      scaffoldMessenger(
        context: context,
        title: 'Gagal Upload Image',
        color: redColor,
        result: result,
      );
    }
    _isLoading = false;
    notifyListeners();
  }

  void getDetailPayment({String? idPembayaran}) async {
    try {
      _isLoading = true;
      await Future.delayed(const Duration(seconds: 1));

      final detailResult = await DetailPaymentService()
          .getDetailPayment(idPembayaran: idPembayaran);

      if (detailResult.data.fotoPembayaran.isNotEmpty) {
        _image =
            '${APIConstant.imageUrl}/img/${detailResult.data.fotoPembayaran}';
      } else {
        _image = '';
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  scaffoldMessenger({
    required BuildContext context,
    required String title,
    required Color color,
    required bool result,
  }) {
    if (result == true) {
      // Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: color,
          content: Text(title),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: color,
          content: Text(title),
        ),
      );
    }
  }
}
