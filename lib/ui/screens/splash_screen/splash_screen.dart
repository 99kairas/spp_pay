import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:spp_pay/shared/theme.dart';
import 'package:spp_pay/ui/screens/splash_screen/splash_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SplashViewModel().checkUserLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 130,
              height: 130,
              child: Image.asset(
                'assets/img_school.png',
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'SD ISLAM\nTELADAN SUCI',
            style: whiteTextStyle.copyWith(
              fontSize: 25,
              fontWeight: medium,
              letterSpacing: 8,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          LoadingAnimationWidget.fourRotatingDots(
            color: whiteColor,
            size: 50,
          ),
        ],
      ),
    );
  }
}
