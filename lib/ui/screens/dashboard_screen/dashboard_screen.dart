import 'package:flutter/material.dart';
import 'package:spp_pay/shared/shared_methods.dart';
import 'package:spp_pay/shared/theme.dart';
import 'package:spp_pay/ui/widgets/dashboard_tagihan_item.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        children: [
          buildProfile(),
          buildCard(),
          buildTagihan(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: whiteColor,
        selectedItemColor: greenColor,
        unselectedItemColor: darkBackgroundColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: greenTextStyle.copyWith(
          fontSize: 13,
          fontWeight: medium,
        ),
        unselectedLabelStyle: blackTextStyle.copyWith(
          fontSize: 10,
          fontWeight: medium,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic_dashboard.png',
              width: 20,
              height: 20,
              color: greenColor,
            ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic_riwayat.png',
              width: 20,
              height: 20,
            ),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic_settings.png',
              width: 20,
              height: 20,
            ),
            label: 'Pengaturan',
          ),
        ],
      ),
    );
  }

  Widget buildProfile() {
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
                  'Rizki Andika Setiadi',
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
            onTap: () {},
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
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

  Widget buildCard() {
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
            'Rizki Andika Setiadi',
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
              overflow: TextOverflow.ellipsis
            ),
          ),
          const SizedBox(height: 28),
          Text(
            '11120029',
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
              letterSpacing: 4,
            ),
          ),
          const SizedBox(height: 21),
          Text(
            'Total Pembayaran : ',
            style: whiteTextStyle.copyWith(
              fontSize: 14,
              fontWeight: regular,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 2),
          SizedBox(
            width: 150,
            child: Text(
              '10',
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

  Widget buildTagihan() {
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
            itemCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: index % 2 == 0
                    ? DashboardTagihanItem(
                        bulan: 'Januari',
                        price: formatCurrency(100000),
                        isVerified: false,
                      )
                    : DashboardTagihanItem(
                        bulan: 'Maret',
                        price: formatCurrency(525000),
                        isVerified: true,
                      ),
              );
            },
          )
        ],
      ),
    );
  }
}
