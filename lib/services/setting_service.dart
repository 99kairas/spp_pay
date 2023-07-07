import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:spp_pay/models/user_information_respnse.dart';
import 'package:spp_pay/shared/shared_methods.dart';

class SettingService {
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

  Future<bool> updateProfile({String? alamat}) async {
    final token = await SharedPref.getToken();

    try {
      final response = await dio.put(
        '${APIConstant.baseUrl}/user/details',
        data: {
          'alamat': alamat,
        },
        options: Options(
          headers: APIConstant.auth('$token'),
        ),
      );
      response.data;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateFotoProfile({String? noIndukSiswa}) async {
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

        form.files.add(MapEntry("imageUpload", mFile));

        final response = await dio.put(
          '${APIConstant.baseUrl}/user/$noIndukSiswa/upload',
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
        return false;
      }
      return true;
    } on DioException catch (e) {
      e.message;
      return false;
    }
  }
}
