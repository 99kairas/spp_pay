import 'package:flutter/material.dart';
import 'package:spp_pay/shared/shared_methods.dart';
import 'package:spp_pay/shared/theme.dart';
import 'package:spp_pay/ui/screens/settings/update_profile_screen.dart';
import 'package:spp_pay/ui/widgets/setting_button_item.dart';

class SettingScreen extends StatefulWidget {
  final String? noIndukSiswa;
  const SettingScreen({
    super.key,
    this.noIndukSiswa,
  });

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.9,
        color: lightBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            settingButtonItem(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateProfileScreen(
                          noIndukSiswa: widget.noIndukSiswa),
                    ));
              },
              color: yellowColor,
              image: 'assets/ic_account.png',
              title: 'Ubah Profile',
            ),
            settingButtonItem(
              onTap: () {
                Navigator.pushNamed(context, '/change-password');
              },
              color: purpleColor,
              image: 'assets/ic_password.png',
              title: 'Ganti Password',
            ),
            settingButtonItem(
              onTap: () {},
              color: greenColor,
              image: 'assets/ic_information.png',
              title: 'Tentang SD Islam Teladan Suci',
            ),
            settingButtonItem(
              onTap: () {},
              color: blackColor,
              image: 'assets/ic_galeri.png',
              title: 'Galeri',
            ),
            settingButtonItem(
              onTap: () {},
              color: blueColor,
              image: 'assets/ic_guru.png',
              title: 'Data Guru dan Staff',
            ),
            const SizedBox(height: 40),
            Text(
              'Lainnya',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(height: 16),
            settingButtonItem(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
                SharedPref.removeToken();
              },
              color: redColor,
              image: 'assets/ic_logout.png',
              title: 'Keluar',
            ),
          ],
        ),
      ),
    );
  }
}
