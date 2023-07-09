import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:spp_pay/shared/theme.dart';
import 'package:spp_pay/ui/screens/settings/setting_view_model.dart';

class GuruScreen extends StatefulWidget {
  const GuruScreen({super.key});

  @override
  State<GuruScreen> createState() => _GuruScreenState();
}

class _GuruScreenState extends State<GuruScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<SettingViewModel>(context, listen: false).getAllGuru();
  }

  @override
  Widget build(BuildContext context) {
    final guruProvider = Provider.of<SettingViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Guru dan Staff'),
      ),
      body: guruProvider.isLoading
          ? Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                color: greenColor,
                size: 50,
              ),
            )
          : ListView.builder(
              itemCount: guruProvider.guru?.length,
              itemBuilder: (context, index) {
                var guru = guruProvider.guru?[index];
                guruProvider.guru?.sort(
                  (a, b) => a.name.compareTo(b.name),
                );
                return Container(
                  height: 150,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: greyColor),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        guru?.name ?? "",
                        style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: regular,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Text(
                        "NIP : ${guru?.nip}",
                        style: greyTextStyle.copyWith(
                          fontSize: 13,
                          fontWeight: regular,
                        ),
                      ),
                      Text(
                        'Pendidikan : ${guru?.pendidikan.name}',
                        style: greyTextStyle.copyWith(
                          fontSize: 13,
                          fontWeight: regular,
                        ),
                      ),
                      Text(
                        'Mata Pelajaran : ${guru?.mataPelajaran.name}',
                        style: greyTextStyle.copyWith(
                          fontSize: 13,
                          fontWeight: regular,
                        ),
                      ),
                      Text(
                        'Jenis Kelamin : ${guru?.jenisKelamin.name}',
                        style: greyTextStyle.copyWith(
                          fontSize: 13,
                          fontWeight: regular,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
