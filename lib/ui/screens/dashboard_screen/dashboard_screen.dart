import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:spp_pay/shared/shared_methods.dart';
import 'package:spp_pay/shared/theme.dart';
import 'package:spp_pay/ui/screens/dashboard_screen/dashboard_view_model.dart';
import 'package:spp_pay/ui/screens/detail_payment/detail_payment_screen.dart';
import 'package:spp_pay/ui/screens/riwayat_pembayaran/riwayat_pembayaran_screen.dart';
import 'package:spp_pay/ui/screens/settings/setting_screen.dart';
import 'package:spp_pay/ui/screens/settings/update_profile_screen.dart';
import 'package:spp_pay/ui/widgets/bottom_navigation_bar_item.dart';
import 'package:spp_pay/ui/widgets/dashboard_tagihan_item.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int monthToValue(String month) {
    switch (month.toLowerCase()) {
      case 'juli':
        return 0;
      case 'agustus':
        return 1;
      case 'september':
        return 2;
      case 'oktober':
        return 3;
      case 'november':
        return 4;
      case 'desember':
        return 5;
      case 'januari':
        return 6;
      case 'februari':
        return 7;
      case 'maret':
        return 8;
      case 'april':
        return 9;
      case 'mei':
        return 10;
      case 'juni':
        return 11;
      default:
        return 0;
    }
  }

  @override
  void initState() {
    super.initState();
    Provider.of<DashboardViewModel>(context, listen: false)
        .getUserInfo(context);
    Provider.of<DashboardViewModel>(context, listen: false)
        .getPembayaran(context);
  }

  int _selectedIndex = 0;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget screenBottomNavigation(int index) {
    final dashboardProvider = Provider.of<DashboardViewModel>(context);

    if (index == 0) {
      return dashboardProvider.isLoading
          ? Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                color: greenColor,
                size: 50,
              ),
            )
          : RefreshIndicator(
              onRefresh: () async {
                dashboardProvider.getPembayaran(context);
                dashboardProvider.getUserInfo(context);
              },
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                children: [
                  buildProfile(context),
                  buildCard(context),
                  buildTagihan(context),
                ],
              ),
            );
    } else if (index == 1) {
      return const RiwayatPembayaranScreen();
    } else if (index == 2) {
      return SettingScreen(
        noIndukSiswa: dashboardProvider.user?.noIndukSiswa,
      );
    } else {
      return const Center(child: Text('Index belum terpasang'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenBottomNavigation(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: whiteColor,
        selectedItemColor: greenColor,
        unselectedItemColor: greyColor,
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
        selectedLabelStyle: greenTextStyle.copyWith(
          fontSize: 13,
          fontWeight: medium,
        ),
        unselectedLabelStyle: blackTextStyle.copyWith(
          fontSize: 10,
          fontWeight: medium,
        ),
        items: [
          bottomNavBarWidget(
            image: 'assets/ic_dashboard.png',
            label: 'Dashboard',
            color: _selectedIndex != 0 ? greyColor : greenColor,
          ),
          bottomNavBarWidget(
            image: 'assets/ic_riwayat.png',
            label: 'Riwayat',
            color: _selectedIndex != 1 ? greyColor : greenColor,
          ),
          bottomNavBarWidget(
            image: 'assets/ic_settings.png',
            label: 'Pengaturan',
            color: _selectedIndex != 2 ? greyColor : greenColor,
          ),
        ],
      ),
    );
  }

  Widget buildProfile(BuildContext context) {
    final dashboardProvider = Provider.of<DashboardViewModel>(context);
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat Datang,',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: regular,
                ),
              ),
              SizedBox(
                width: 230,
                child: Text(
                  '${dashboardProvider.user?.namaSiswa}',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateProfileScreen(
                        noIndukSiswa: dashboardProvider.user?.noIndukSiswa),
                  ));
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: dashboardProvider.image != ''
                      ? NetworkImage(dashboardProvider.image ?? "")
                          as ImageProvider
                      : const AssetImage(
                          'assets/img_profile.png',
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(BuildContext context) {
    final dashboardProvider = Provider.of<DashboardViewModel>(context);

    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.all(28),
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/img_card.png',
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${dashboardProvider.user?.namaSiswa}',
            style: whiteTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
                overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(height: 10),
          Text(
            '${dashboardProvider.user?.noIndukSiswa}',
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
              letterSpacing: 4,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Total Tagihan : ',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 2),
          SizedBox(
            width: 100,
            child: Text(
              '${dashboardProvider.getTotalTagihan}',
              style: whiteTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTagihan(BuildContext context) {
    final dashboardProvider = Provider.of<DashboardViewModel>(context);

    dashboardProvider.pembayaran?.sort((a, b) {
      int monthA = monthToValue(a.spp?.bulan ?? "");
      int yearA = int.tryParse(a.spp?.tahun ?? "") ?? 0;

      int monthB = monthToValue(b.spp?.bulan ?? "");
      int yearB = int.tryParse(b.spp?.tahun ?? "") ?? 0;

      if (yearA != yearB) {
        return yearB - yearA;
      } else {
        return monthA - monthB;
      }
    });

    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tagihan',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          // const SizedBox(height: 15),
          ListView.builder(
            padding: const EdgeInsets.only(top: 15),
            itemCount: dashboardProvider.pembayaran?.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var pembayaran = dashboardProvider.pembayaran?[index];

              return pembayaran?.status == 0 || pembayaran?.status == 2
                  ? DashboardTagihanItem(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPaymentScreen(
                                idPembayaran: pembayaran?.idPembayaran,
                              ),
                            ));
                      },
                      bulan: '${pembayaran?.spp?.bulan}',
                      price: formatCurrency(
                          int.parse(pembayaran?.spp?.jumlah ?? "")),
                      isVerified: pembayaran?.status,
                    )
                  : Container();
            },
          )
        ],
      ),
    );
  }
}
