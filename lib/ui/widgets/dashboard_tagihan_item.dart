import 'package:flutter/material.dart';
import 'package:spp_pay/shared/theme.dart';

class DashboardTagihanItem extends StatelessWidget {
  final String bulan;
  final String price;
  final bool isVerified;
  const DashboardTagihanItem({
    super.key,
    required this.bulan,
    required this.price,
    required this.isVerified,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
        border: Border.all(
          width: 1,
          color: greyColor,
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bulan,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                price,
                style: greyTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: regular,
                ),
              ),
            ],
          ),
          const Spacer(),
          isVerified
              ? Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 14,
                      color: greenColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Lunas',
                      style: greenTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 13,
                      ),
                    ),
                  ],
                )
              : Row(
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
    );
  }
}