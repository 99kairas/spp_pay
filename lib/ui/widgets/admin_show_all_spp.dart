import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:spp_pay/shared/shared_methods.dart';
import 'package:spp_pay/shared/theme.dart';
import 'package:spp_pay/ui/screens/admin_dashboard/admin_dashboard_view_model.dart';

class AdminShowAllSpp extends StatefulWidget {
  const AdminShowAllSpp({super.key});

  @override
  State<AdminShowAllSpp> createState() => _AdminShowAllSppState();
}

class _AdminShowAllSppState extends State<AdminShowAllSpp> {
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
              );
            },
          );
  }
}
