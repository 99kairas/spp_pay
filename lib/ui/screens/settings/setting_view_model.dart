// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:spp_pay/models/user_information_respnse.dart';
import 'package:spp_pay/services/setting_service.dart';
import 'package:spp_pay/shared/shared_methods.dart';
import 'package:spp_pay/shared/theme.dart';
import 'package:spp_pay/ui/widgets/scaffold_messenger.dart';

class SettingViewModel with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  UserInformation? _user;
  UserInformation? get user => _user;

  String? _image;
  String? get image => _image;

  void getUserInfo(BuildContext context) async {
    try {
      _isLoading = true;
      final result = await SettingService().getUserInfo();
      if (result.data != '') {
        _user = result.data;
        if (result.data.fotoProfil == '') {
          _image = '';
        } else {
          _image = '${APIConstant.imageUrl}/img/${result.data.fotoProfil}';
        }
      }
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  // PROPERTY OF UPDATE PROFILE
  TextEditingController alamatController = TextEditingController(text: '');

  void updateProfile(BuildContext context) async {
    try {
      if (alamatController.text == '' ||
          alamatController.text.isEmpty ||
          alamatController.text.length < 5) {
        scaffoldMessenger(
          context: context,
          title: 'Alamat tidak boleh kosong atau kurang dari 5 huruf',
          color: redColor,
        );
      } else {
        final result = await SettingService().updateProfile(
          alamat: alamatController.text,
        );

        if (result == true) {
          scaffoldMessenger(
            context: context,
            title: 'berhasil ubah profil',
            color: greenColor,
            result: result,
          );
          alamatController.clear();
        } else {
          scaffoldMessenger(
            context: context,
            title: 'gagal ubah profile',
            color: redColor,
            result: result,
          );
        }
      }

      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  void updateFotoProfile({
    required BuildContext context,
    String? noIndukSiswa,
  }) async {
    _isLoading = true;
    final result =
        await SettingService().updateFotoProfile(noIndukSiswa: noIndukSiswa);
    if (result == true) {
      scaffoldMessenger(
        context: context,
        title: 'berhasil ubah foto profil',
        color: greenColor,
        result: result,
      );
    } else {
      scaffoldMessenger(
        context: context,
        title: 'gagal ubah foto profil',
        color: redColor,
        result: result,
      );
    }
    _isLoading = false;
    notifyListeners();
  }

  // PROPERTY OF CHANGE PASSWORD
  TextEditingController oldPasswordController = TextEditingController(text: '');
  TextEditingController newPasswordController = TextEditingController(text: '');

  bool _isHidePassword = true;
  bool get isHidePassword => _isHidePassword;

  bool _isHideNewPassword = true;
  bool get isHideNewPassword => _isHideNewPassword;

  void showHidePassword() {
    _isHidePassword = !_isHidePassword;
    notifyListeners();
  }

  void showHideNewPassword() {
    _isHideNewPassword = !_isHideNewPassword;
    notifyListeners();
  }

  void changePassword(BuildContext context) async {
    final result = await SettingService().changePassword(
      password: oldPasswordController.text,
      newPassword: newPasswordController.text,
    );
    if (result == true) {
      scaffoldMessenger(
        context: context,
        title: 'berhasil mengganti password',
        color: greenColor,
        result: result,
      );
      oldPasswordController.clear();
      newPasswordController.clear();
      Navigator.pop(context);
    } else {
      scaffoldMessenger(
        context: context,
        title: 'gagal mengganti password',
        color: redColor,
        result: result,
      );
    }
    _isLoading = false;
    notifyListeners();
  }
}
