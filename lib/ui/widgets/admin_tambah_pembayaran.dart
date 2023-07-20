import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:spp_pay/shared/shared_methods.dart';
import 'package:spp_pay/shared/theme.dart';
import 'package:spp_pay/ui/screens/admin_dashboard/admin_dashboard_view_model.dart';
import 'package:spp_pay/ui/widgets/buttons.dart';
import 'package:spp_pay/ui/widgets/form.dart';

class AdminTambahPembayaran extends StatefulWidget {
  const AdminTambahPembayaran({super.key});

  @override
  State<AdminTambahPembayaran> createState() => _AdminTambahPembayaranState();
}

class _AdminTambahPembayaranState extends State<AdminTambahPembayaran> {
  @override
  void initState() {
    super.initState();
    Provider.of<AdminDashboardViewModel>(context, listen: false).getAllSpp();
  }

  @override
  Widget build(BuildContext context) {
    final adminDashboardProvider =
        Provider.of<AdminDashboardViewModel>(context);
    return adminDashboardProvider.isLoading
        ? Center(
            child: LoadingAnimationWidget.fourRotatingDots(
              color: greenColor,
              size: 50,
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.only(top: 15),
            itemCount: adminDashboardProvider.allSpp?.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var spp = adminDashboardProvider.allSpp?[index];
              return Container(
                height: 150,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminTambahPembayaranDetails(
                            idSpp: spp?.idSpp.toString(),
                            bulan: spp?.bulan,
                            tahun: spp?.tahun,
                            jumlah: double.tryParse(spp?.jumlah ?? ""),
                          ),
                        ));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 18),
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor,
                      border: Border.all(
                        width: 1,
                        color: greyColor,
                      ),
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            spp?.tahun ?? "",
                            style: blackTextStyle.copyWith(
                              fontSize: 15,
                              fontWeight: semiBold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Text(
                              spp?.bulan ?? "",
                              style: blackTextStyle.copyWith(
                                fontSize: 15,
                                fontWeight: medium,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              formatCurrency(int.parse(spp?.jumlah ?? "")),
                              style: greyTextStyle.copyWith(
                                fontSize: 15,
                                fontWeight: regular,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }
}

class AdminTambahPembayaranDetails extends StatefulWidget {
  final String? idSpp;
  final String? bulan;
  final String? tahun;
  final double? jumlah;

  const AdminTambahPembayaranDetails({
    super.key,
    this.idSpp,
    this.bulan,
    this.tahun,
    this.jumlah,
  });

  @override
  State<AdminTambahPembayaranDetails> createState() =>
      _AdminTambahPembayaranDetailsState();
}

class _AdminTambahPembayaranDetailsState
    extends State<AdminTambahPembayaranDetails> {
  bool? isAllSiswa;
  bool? isSiswa;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Pembayaran'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isAllSiswa = true;
                    isSiswa = false;
                  });
                },
                child: Container(
                  width: 143,
                  height: 51,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    border: Border.all(
                      width: 2,
                      color: isAllSiswa == true ? blackColor : greyColor,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      'Semua Siswa',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isAllSiswa = false;
                    isSiswa = true;
                  });
                },
                child: Container(
                  width: 143,
                  height: 51,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    border: Border.all(
                      width: 2,
                      color: isSiswa == true ? blackColor : greyColor,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      'Satu Siswa',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (isAllSiswa == true) buildAllSiswa(context),
          if (isSiswa == true) buildSiswa(context)
        ],
      ),
    );
  }

  Widget buildAllSiswa(BuildContext context) {
    final adminTambahPembayaran = Provider.of<AdminDashboardViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 1,
              color: greyColor,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'No SPP : ${widget.idSpp.toString()}',
                style: blackTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: semiBold,
                    overflow: TextOverflow.ellipsis),
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tahun Ajaran : ${widget.tahun.toString()}',
                    style: blackTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Bulan : ${widget.bulan.toString()}',
                        style: blackTextStyle.copyWith(
                          fontSize: 13,
                          fontWeight: medium,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        formatCurrency(
                          double.tryParse(
                                widget.jumlah.toString(),
                              ) ??
                              0,
                        ),
                        style: blackTextStyle.copyWith(
                          fontSize: 13,
                          fontWeight: regular,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.25),
        CustomFilledButton(
          title: 'Tambah Pembayaran ke Semua Siswa',
          onPressed: () {
            AwesomeDialog(
              context: context,
              btnCancelOnPress: () {},
              btnOkOnPress: () {
                adminTambahPembayaran.addAllPembayaran(context, widget.idSpp);
              },
              dialogType: DialogType.QUESTION,
              title: 'Apakah kamu yakin ingin menambahkan pembayaran?',
              dismissOnTouchOutside: false,
            ).show();
          },
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget buildSiswa(BuildContext context) {
    final adminTambahPembayaran = Provider.of<AdminDashboardViewModel>(context);
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          CustomFormField(
            title: 'No Induk Siswa',
            controller: adminTambahPembayaran.pembayaranSiswaController,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.55),
          CustomFilledButton(
            title: 'Tambah Pembayaran',
            onPressed: () {
              adminTambahPembayaran.addPembayaranByNIS(
                context,
                widget.idSpp,
              );
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
