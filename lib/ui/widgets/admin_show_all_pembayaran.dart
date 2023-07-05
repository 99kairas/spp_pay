import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:spp_pay/shared/shared_methods.dart';
import 'package:spp_pay/shared/theme.dart';
import 'package:spp_pay/ui/screens/admin_dashboard/admin_dashboard_view_model.dart';

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

    return adminDashboardProvider.isLoading
        ? Center(
            child: LoadingAnimationWidget.fourRotatingDots(
              color: greenColor,
              size: 50,
            ),
          )
        : Container(
            margin: const EdgeInsets.only(top: 20),
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 15),
              itemCount: adminDashboardProvider.allPembayaran?.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var pembayaran = adminDashboardProvider.allPembayaran?[index];
                return pembayaran?.status == false &&
                        pembayaran?.fotoPembayaran != ''
                    ? Container(
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        child: InkWell(
                          onTap: () {},
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    SizedBox(
                                      width: 14,
                                      child: Image.asset(
                                        'assets/ic_uncheck.png',
                                        color: redColor,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'Belum Lunas',
                                      style: redTextStyle.copyWith(
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
                      )
                    : Container();
              },
            ),
          );
  }
}
