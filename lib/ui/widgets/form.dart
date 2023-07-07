import 'package:flutter/material.dart';
import 'package:spp_pay/shared/theme.dart';

class CustomFormField extends StatelessWidget {
  final String title;
  final bool obscureText;
  final TextEditingController? controller;
  final bool isShowTitle;
  final Widget? suffixIcon;
  final String? hintText;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool? enabled;
  final double? letterSpacing;

  const CustomFormField({
    super.key,
    required this.title,
    this.obscureText = false,
    this.controller,
    this.isShowTitle = true,
    this.suffixIcon,
    this.hintText,
    this.onChanged,
    this.keyboardType,
    this.enabled,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isShowTitle)
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: medium,
            ),
          ),
        if (isShowTitle) const SizedBox(height: 8),
        TextFormField(
          obscureText: obscureText,
          controller: controller,
          obscuringCharacter: '*',
          enabled: enabled,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: greyTextStyle.copyWith(
              fontSize: 14,
              fontWeight: regular,
              letterSpacing: letterSpacing,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: const EdgeInsets.all(12),
          ),
        ),
      ],
    );
  }
}
