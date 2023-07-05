import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spp_pay/ui/screens/admin_dashboard/admin_dashboard_view_model.dart';
import 'package:spp_pay/ui/widgets/buttons.dart';
import 'package:spp_pay/ui/widgets/form.dart';

class AdminTambahSpp extends StatefulWidget {
  const AdminTambahSpp({super.key});

  @override
  State<AdminTambahSpp> createState() => _AdminTambahSppState();
}

class _AdminTambahSppState extends State<AdminTambahSpp> {
  @override
  Widget build(BuildContext context) {
    final adminDashboardProvider =
        Provider.of<AdminDashboardViewModel>(context);
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          CustomFormField(
            title: 'Tahun Ajaran',
            hintText: 'Masukkan Tahun Ajaran',
            controller: adminDashboardProvider.tahunSppController,
          ),
          const SizedBox(height: 15),
          CustomFormField(
            title: 'Bulan',
            hintText: 'Masukkan Bulan',
            controller: adminDashboardProvider.bulanSppController,
          ),
          const SizedBox(height: 15),
          CustomFormField(
            title: 'Jumlah',
            hintText: 'Masukkan Jumlah',
            controller: adminDashboardProvider.jumlahSppController,
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.425,
          ),
          CustomFilledButton(
            title: 'Tambahkan SPP',
            onPressed: () {
              if (adminDashboardProvider.tahunSppController.text.isEmpty ||
                  adminDashboardProvider.bulanSppController.text.isEmpty ||
                  adminDashboardProvider.jumlahSppController.text.isEmpty) {
                adminDashboardProvider.addSpp(context);
              } else {
                AwesomeDialog(
                  context: context,
                  btnCancelOnPress: () {},
                  btnOkOnPress: () {
                    adminDashboardProvider.addSpp(context);
                  },
                  dialogType: DialogType.QUESTION,
                  title: 'Apakah kamu yakin ingin menambahkan SPP?',
                  dismissOnTouchOutside: false,
                ).show();
              }
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
