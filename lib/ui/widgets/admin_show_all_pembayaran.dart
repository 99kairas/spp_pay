import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:spp_pay/shared/shared_methods.dart';
import 'package:spp_pay/shared/theme.dart';
import 'package:spp_pay/ui/screens/admin_dashboard/admin_dashboard_view_model.dart';
import 'dart:core';

class AdminShowAllPembayaran extends StatefulWidget {
  const AdminShowAllPembayaran({super.key});

  @override
  State<AdminShowAllPembayaran> createState() => _AdminShowAllPembayaranState();
}

class _AdminShowAllPembayaranState extends State<AdminShowAllPembayaran> {
  @override
  void initState() {
    super.initState();
    Provider.of<AdminDashboardViewModel>(context, listen: false)
        .getAllPembayaran();
  }

  @override
  Widget build(BuildContext context) {
    final adminDashboardProvider =
        Provider.of<AdminDashboardViewModel>(context);

    adminDashboardProvider.allPembayaran?.sort((a, b) {
      int statusA = a.status ?? 0;
      int statusB = b.status ?? 0;

      if (statusA == 2 && statusB != 2) {
        return -1;
      } else if (statusA != 2 && statusB == 2) {
        return 1;
      } else {
        return 0;
      }
    });

    return adminDashboardProvider.isLoading
        ? Center(
            child: LoadingAnimationWidget.fourRotatingDots(
              color: greenColor,
              size: 50,
            ),
          )
        : RefreshIndicator(
            onRefresh: () async {
              adminDashboardProvider.getAllPembayaran();
            },
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 15),
                itemCount: adminDashboardProvider.allPembayaran?.length,
                itemBuilder: (context, index) {
                  var pembayaran = adminDashboardProvider.allPembayaran?[index];

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    child: InkWell(
                      onTap: pembayaran?.status == 2
                          ? () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPembayaranUser(
                                      idPembayaran: pembayaran?.idPembayaran,
                                    ),
                                  ));
                            }
                          : null,
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
                        child: Row(
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              flex: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    pembayaran?.siswa?.namaSiswa ?? "",
                                    style: blackTextStyle.copyWith(
                                      fontSize: 15,
                                      fontWeight: medium,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    formatCurrency(int.parse(
                                        pembayaran?.spp?.jumlah ?? "")),
                                    style: greyTextStyle.copyWith(
                                      fontSize: 12,
                                      fontWeight: regular,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                if (pembayaran?.status == 0)
                                  SizedBox(
                                    width: 14,
                                    child: Image.asset(
                                      'assets/ic_uncheck.png',
                                      color: redColor,
                                    ),
                                  ),
                                if (pembayaran?.status == 2)
                                  SizedBox(
                                    width: 14,
                                    child: Image.asset(
                                      'assets/ic_ditinjau.png',
                                      color: yellowColor,
                                    ),
                                  ),
                                if (pembayaran?.status == 1)
                                  Icon(
                                    Icons.check_circle,
                                    size: 14,
                                    color: greenColor,
                                  ),
                                const SizedBox(width: 4),
                                if (pembayaran?.status == 0)
                                  Text(
                                    'Belum Lunas',
                                    style: redTextStyle.copyWith(
                                      fontWeight: medium,
                                      fontSize: 11,
                                    ),
                                  ),
                                if (pembayaran?.status == 2)
                                  Text(
                                    'Perlu Ditinjau',
                                    style: yellowTextStyle.copyWith(
                                      fontWeight: medium,
                                      fontSize: 11,
                                    ),
                                  ),
                                if (pembayaran?.status == 1)
                                  Text(
                                    'Lunas',
                                    style: greenTextStyle.copyWith(
                                      fontWeight: medium,
                                      fontSize: 11,
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
              ),
            ),
          );
  }
}

class DetailPembayaranUser extends StatefulWidget {
  final String? idPembayaran;

  const DetailPembayaranUser({
    super.key,
    this.idPembayaran,
  });

  @override
  State<DetailPembayaranUser> createState() => _DetailPembayaranUserState();
}

class _DetailPembayaranUserState extends State<DetailPembayaranUser> {
  @override
  void initState() {
    super.initState();
    Provider.of<AdminDashboardViewModel>(context, listen: false)
        .getUserInfo(context, widget.idPembayaran);
  }

  @override
  Widget build(BuildContext context) {
    final detailUser = Provider.of<AdminDashboardViewModel>(context);
    var user = detailUser.user;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rincian Pembayaran Siswa'),
      ),
      body: detailUser.isLoading
          ? Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                color: greenColor,
                size: 50,
              ),
            )
          : SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),
                    Text(
                      'Pembayaran',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      width: 327,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: greyColor,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              user?.spp.tahun ?? "",
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                              ),
                            ),
                          ),
                          const SizedBox(height: 34),
                          Text(
                            user?.siswa.namaSiswa ?? "",
                            style: blackTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: regular,
                              letterSpacing: 2,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            user?.siswa.kelas ?? "",
                            style: blackTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: regular,
                              letterSpacing: 2,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            user?.noIndukSiswa ?? "",
                            style: blackTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: regular,
                              letterSpacing: 2,
                            ),
                          ),
                          const SizedBox(height: 28),
                          Center(
                            child: Flexible(
                              flex: 1,
                              child: Text(
                                'No Tagihan : ${user?.idPembayaran}',
                                style: blackTextStyle.copyWith(
                                  fontSize: 15,
                                  fontWeight: medium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 42),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Bulan\n${user?.spp.bulan}',
                                style: blackTextStyle.copyWith(
                                  fontSize: 14,
                                  letterSpacing: 1,
                                  fontWeight: regular,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                formatCurrency(
                                    int.parse(user?.spp.jumlah ?? "")),
                                style: greyTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: medium,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Foto Pembayaran :',
                            style: blackTextStyle.copyWith(
                              fontSize: 14,
                              letterSpacing: 1,
                              fontWeight: regular,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              AwesomeDialog(
                                context: context,
                                dismissOnTouchOutside: false,
                                btnOkOnPress: () {
                                  detailUser.approvePembayaran(
                                      context, widget.idPembayaran);
                                },
                                btnCancelOnPress: () {
                                  detailUser.declinePembayaran(
                                      context, widget.idPembayaran);
                                },
                                btnOkText: 'Setujui',
                                btnCancelText: 'Tolak',
                                body: Image.network(detailUser.image ?? ""),
                              ).show();
                            },
                            child: const Text('Klik untuk melihat foto'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.325),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
    );
  }
}
