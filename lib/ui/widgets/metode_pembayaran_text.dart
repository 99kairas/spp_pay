import 'package:flutter/material.dart';
import 'package:spp_pay/shared/theme.dart';

class MetodePembayaranText extends StatelessWidget {
  final String title;
  const MetodePembayaranText({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: blackTextStyle.copyWith(
            fontSize: 15,
            fontWeight: medium,
            letterSpacing: 1,
          ),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
