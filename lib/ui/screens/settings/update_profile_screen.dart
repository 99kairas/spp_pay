// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:spp_pay/shared/theme.dart';
import 'package:spp_pay/ui/screens/settings/setting_view_model.dart';
import 'package:spp_pay/ui/widgets/buttons.dart';
import 'package:spp_pay/ui/widgets/form.dart';

class UpdateProfileScreen extends StatefulWidget {
  final String? noIndukSiswa;
  const UpdateProfileScreen({
    super.key,
    this.noIndukSiswa,
  });

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<SettingViewModel>(context, listen: false).getUserInfo(context);
  }

  @override
  Widget build(BuildContext context) {
    final updateProvider = Provider.of<SettingViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Profil'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          updateProvider.isLoading
              ? Center(
                  child: LoadingAnimationWidget.fourRotatingDots(
                    color: greenColor,
                    size: 50,
                  ),
                )
              : updateProvider.getUserInfo(context);
        },
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            InkWell(
              onTap: () {
                updateProvider.updateFotoProfile(
                  context: context,
                  noIndukSiswa: updateProvider.user?.noIndukSiswa,
                );
              },
              child: Container(
                width: 130,
                height: 130,
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  border: updateProvider.image != null
                      ? null
                      : Border.all(width: 2, color: blackColor),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: updateProvider.image != ''
                        ? NetworkImage(updateProvider.image ?? "")
                            as ImageProvider
                        : AssetImage(
                            'assets/img_profile.png',
                          ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            CustomFormField(
              title: 'Nama Lengkap',
              hintText: '${updateProvider.user?.namaSiswa.toUpperCase()}',
              enabled: false,
              letterSpacing: 2,
            ),
            SizedBox(height: 10),
            CustomFormField(
              title: 'No Induk Siswa',
              hintText: '${updateProvider.user?.noIndukSiswa}',
              enabled: false,
              letterSpacing: 5,
            ),
            SizedBox(height: 10),
            CustomFormField(
              title: 'Kelas',
              hintText: '${updateProvider.user?.kelas}',
              enabled: false,
              letterSpacing: 3,
            ),
            SizedBox(height: 10),
            CustomFormField(
              title: 'Alamat',
              controller: updateProvider.alamatController,
              hintText: '${updateProvider.user?.alamat}',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            CustomFilledButton(
              title: 'Simpan Perubahan',
              onPressed: () {
                updateProvider.updateProfile(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
