import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spp_pay/ui/screens/settings/setting_view_model.dart';
import 'package:spp_pay/ui/widgets/buttons.dart';
import 'package:spp_pay/ui/widgets/form.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final changePasswordProvider = Provider.of<SettingViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ganti Password'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          CustomFormField(
            title: 'Password Lama',
            controller: changePasswordProvider.oldPasswordController,
            obscureText: changePasswordProvider.isHidePassword,
            suffixIcon: IconButton(
              onPressed: () {
                changePasswordProvider.showHidePassword();
              },
              icon: SizedBox(
                  width: 20,
                  height: 20,
                  child: Image.asset(
                    changePasswordProvider.isHidePassword
                        ? 'assets/ic_eye_lock.png'
                        : 'assets/ic_eye.png',
                  )),
            ),
          ),
          const SizedBox(height: 20),
          CustomFormField(
            title: 'Password Baru',
            controller: changePasswordProvider.newPasswordController,
            obscureText: changePasswordProvider.isHideNewPassword,
            suffixIcon: IconButton(
              onPressed: () {
                changePasswordProvider.showHideNewPassword();
              },
              icon: SizedBox(
                  width: 20,
                  height: 20,
                  child: Image.asset(
                    changePasswordProvider.isHideNewPassword
                        ? 'assets/ic_eye_lock.png'
                        : 'assets/ic_eye.png',
                  )),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          CustomFilledButton(
            title: 'Ganti Password',
            onPressed: () {
              changePasswordProvider.changePassword(context);
            },
          ),
        ],
      ),
    );
  }
}
