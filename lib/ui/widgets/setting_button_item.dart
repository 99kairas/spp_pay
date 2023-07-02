import 'package:flutter/material.dart';
import 'package:spp_pay/shared/theme.dart';

Widget settingButtonItem({
  required void Function()? onTap,
  required String image,
  required String title,
  Color? color,
}) {
  return Column(
    children: [
      InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 335,
          height: 63,
          child: Row(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.asset(
                    image,
                    width: 25,
                    height: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                flex: 10,
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_circle_right,
                color: greyColor,
              ),
            ],
          ),
        ),
      ),
      const Divider(
        thickness: 2,
      ),
      const SizedBox(height: 5),
    ],
  );
}
