import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spp_pay/shared/theme.dart';
import 'package:spp_pay/ui/screens/login_screen.dart/login_view_model.dart';
import 'package:spp_pay/ui/widgets/buttons.dart';
import 'package:spp_pay/ui/widgets/form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginViewModel>(context);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 76, horizontal: 24),
        children: [
          SizedBox(
            width: 130,
            height: 130,
            child: Image.asset(
              'assets/img_school.png',
            ),
          ),
          const SizedBox(height: 46),
          Text(
            'Selamat Datang,\nSilahkan Login',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                CustomFormField(
                  title: 'No Induk Siswa',
                  hintText: 'Masukkan Nomor Induk Siswa',
                  controller: loginProvider.nisController,
                ),
                const SizedBox(height: 16),
                CustomFormField(
                  title: 'Password',
                  hintText: 'Masukkan Password',
                  controller: loginProvider.passwordController,
                  obscureText: loginProvider.isHidePassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      loginProvider.showHidePassword();
                    },
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(
                          loginProvider.isHidePassword
                              ? 'assets/ic_eye_lock.png'
                              : 'assets/ic_eye.png',
                        )),
                  ),
                ),
                const SizedBox(height: 60),
                CustomFilledButton(
                  title: 'Masuk',
                  onPressed: () {
                    loginProvider.loginProvider(context);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 68),
          Center(
            child: CustomTextButton(
              title: 'Admin Klik Disini',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
