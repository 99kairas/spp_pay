import 'package:flutter/material.dart';
import 'package:spp_pay/shared/theme.dart';

class AdminDashboardDrawerItem extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final bool? isSelect;
  const AdminDashboardDrawerItem({
    super.key,
    required this.title,
    this.onTap,
    this.isSelect = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isSelect == true ? greenColor : null,
        border: Border.all(
          color: greyColor,
          width: 2,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            title,
            style: isSelect == true
                ? whiteTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: semiBold,
                  )
                : blackTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: semiBold,
                  ),
          ),
        ),
      ),
    );
  }
}
