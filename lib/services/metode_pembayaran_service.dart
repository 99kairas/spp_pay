import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:spp_pay/shared/shared_methods.dart';

class MetodePembayaranService {
  Future<bool> uploadImage({String? idPembayaran}) async {
    final token = await SharedPref.getToken();
    var dio = Dio();
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      var resolver = MimeTypeResolver();

      if (result != null) {
        File file = File(result.files.single.path ?? " ");
        String filename = file.path.split('/').last;
        var mediaType = MediaType.parse(
            resolver.lookup(file.path) ?? "application/octet-stream");
        var n = file.lengthSync();
        var mFile = MultipartFile(file.openRead(0, n), n,
            filename: filename, contentType: mediaType);

        var form = FormData();

        form.files.add(MapEntry("foto_pembayaran", mFile));

        final response = await dio.put(
          '${APIConstant.baseUrl}/pembayaran/$idPembayaran/upload',
          data: form,
          options: Options(
            headers: {
              "authorization": '$token',
            },
          ),
        );
        if (response.statusCode == 200) {
          return true;
        }
      } else {
        print('Result is null');
        return false;
      }
      return true;
    } on DioException catch (e) {
      e.message;
      return false;
    }
  }
}
