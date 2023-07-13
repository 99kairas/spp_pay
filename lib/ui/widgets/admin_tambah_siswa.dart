// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spp_pay/ui/screens/admin_dashboard/admin_dashboard_view_model.dart';
import 'package:spp_pay/ui/widgets/buttons.dart';
import 'package:spp_pay/ui/widgets/form.dart';

class AdminTambahSiswa extends StatefulWidget {
  const AdminTambahSiswa({super.key});

  @override
  State<AdminTambahSiswa> createState() => _AdminTambahSiswaState();
}

class _AdminTambahSiswaState extends State<AdminTambahSiswa> {
  @override
  Widget build(BuildContext context) {
    final tambahSiswaProvider = Provider.of<AdminDashboardViewModel>(context);
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        SizedBox(height: 20),
        CustomFormField(
          title: 'No Induk Siswa',
          controller: tambahSiswaProvider.nisController,
        ),
        SizedBox(height: 20),
        CustomFormField(
          title: 'Nama Siswa',
          controller: tambahSiswaProvider.namaController,
        ),
        SizedBox(height: 20),
        CustomFormField(
          title: 'Kelas',
          controller: tambahSiswaProvider.kelasController,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.4),
        CustomFilledButton(
          title: 'Tambah Siswa',
          onPressed: () {
            tambahSiswaProvider.addSiswa(context);
          },
        ),
      ],
    );
  }
}
