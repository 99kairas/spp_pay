import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spp_pay/shared/theme.dart';
import 'package:spp_pay/ui/screens/admin_login_screen/admin_login_view_model.dart';
import 'package:spp_pay/ui/widgets/buttons.dart';
import 'package:spp_pay/ui/widgets/form.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  @override
  Widget build(BuildContext context) {
    final adminProvider = Provider.of<AdminLoginViewModel>(context);
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
            'Selamat Datang,\nAdmin Teladan',
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
                  title: 'Username',
                  hintText: 'Masukkan Username',
                  controller: adminProvider.nisController,
                ),
                const SizedBox(height: 16),
                CustomFormField(
                  title: 'Password',
                  hintText: 'Masukkan Password',
                  controller: adminProvider.passwordController,
                  obscureText: adminProvider.isHidePassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      adminProvider.showHidePassword();
                    },
                    icon: SizedBox(
                      width: 20,
                      height: 20,
                      child: Image.asset(
                        adminProvider.isHidePassword
                            ? 'assets/ic_eye_lock.png'
                            : 'assets/ic_eye.png',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                CustomFilledButton(
                  title: 'Masuk',
                  onPressed: () {
                    adminProvider.loginProvider(context);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 68),
          Center(
            child: CustomTextButton(
              title: 'User Klik Disini',
              onPressed: () {
                adminProvider.navigateToUserLogin(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
