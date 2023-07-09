import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spp_pay/shared/theme.dart';
import 'package:spp_pay/ui/screens/admin_dashboard/admin_dashboard_screen.dart';
import 'package:spp_pay/ui/screens/admin_dashboard/admin_dashboard_view_model.dart';
import 'package:spp_pay/ui/screens/admin_login_screen/admin_login_view_model.dart';
import 'package:spp_pay/ui/screens/dashboard_screen/dashboard_screen.dart';
import 'package:spp_pay/ui/screens/dashboard_screen/dashboard_view_model.dart';
import 'package:spp_pay/ui/screens/detail_payment/detail_payment_view_model.dart';
import 'package:spp_pay/ui/screens/login_screen.dart/login_screen.dart';
import 'package:spp_pay/ui/screens/login_screen.dart/login_view_model.dart';
import 'package:spp_pay/ui/screens/metode_pembayaran/metode_pembayaran_view_model.dart';
import 'package:spp_pay/ui/screens/riwayat_pembayaran/riwayat_pembayaran_view_model.dart';
import 'package:spp_pay/ui/screens/settings/change_password_screen.dart';
import 'package:spp_pay/ui/screens/settings/guru_screen.dart';
import 'package:spp_pay/ui/screens/settings/setting_view_model.dart';
import 'package:spp_pay/ui/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginViewModel>(
          create: (_) => LoginViewModel(),
        ),
        ChangeNotifierProvider<DashboardViewModel>(
          create: (_) => DashboardViewModel(),
        ),
        ChangeNotifierProvider<DetailPaymentViewModel>(
          create: (_) => DetailPaymentViewModel(),
        ),
        ChangeNotifierProvider<MetodePembayaranViewModel>(
          create: (_) => MetodePembayaranViewModel(),
        ),
        ChangeNotifierProvider<RiwayatPembayaranViewModel>(
          create: (_) => RiwayatPembayaranViewModel(),
        ),
        ChangeNotifierProvider<AdminLoginViewModel>(
          create: (_) => AdminLoginViewModel(),
        ),
        ChangeNotifierProvider<AdminDashboardViewModel>(
          create: (_) => AdminDashboardViewModel(),
        ),
        ChangeNotifierProvider<SettingViewModel>(
          create: (_) => SettingViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: lightBackgroundColor,
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: blackColor,
          ),
          backgroundColor: lightBackgroundColor,
          titleTextStyle: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/admin-dashboard': (context) => const AdminDashboardScreen(),
        '/change-password': (context) => const ChangePasswordScreen(),
        '/guru': (context) => const GuruScreen(),
      },
    );
  }
}
