import 'package:flutter/material.dart';
import 'package:spp_pay/shared/theme.dart';

class RiwayatPembayaranItem extends StatelessWidget {
  final String bulan;
  final String price;
  final String tahun;
  final String? tagihan;
  final int? isVerified;
  final Function()? onTap;

  const RiwayatPembayaranItem({
    super.key,
    required this.bulan,
    required this.price,
    this.isVerified = 0,
    this.onTap,
    this.tagihan,
    required this.tahun,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
                  tahun,
                  style: blackTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  bulan,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  price,
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const Spacer(),
            isVerified == 1
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
      ),
    );
  }
}
