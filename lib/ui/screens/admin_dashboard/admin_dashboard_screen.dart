import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spp_pay/shared/shared_methods.dart';
import 'package:spp_pay/shared/theme.dart';
import 'package:spp_pay/ui/screens/admin_dashboard/admin_dashboard_view_model.dart';
import 'package:spp_pay/ui/widgets/admin_dashboard_drawer_item.dart';
import 'package:spp_pay/ui/widgets/admin_show_all_pembayaran.dart';
import 'package:spp_pay/ui/widgets/admin_show_all_spp.dart';
import 'package:spp_pay/ui/widgets/admin_tambah_pembayaran.dart';
import 'package:spp_pay/ui/widgets/admin_tambah_spp.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<AdminDashboardViewModel>(context, listen: false)
        .getAllPembayaran();
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List _widgetOptions = [
    const AdminTambahPembayaran(),
    const AdminShowAllPembayaran(),
    const AdminTambahSpp(),
    const AdminShowAllSpp(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
              SharedPref.removeToken();
            },
            icon: Image.asset(
              'assets/ic_logout.png',
              width: 25,
              height: 25,
              color: blackColor,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              AdminDashboardDrawerItem(
                title: 'Tambah Pembayaran',
                onTap: () {
                  _onItemTapped(0);
                  Navigator.pop(context);
                },
                isSelect: _selectedIndex == 0,
              ),
              AdminDashboardDrawerItem(
                title: 'Lihat Semua Pembayaran',
                onTap: () {
                  _onItemTapped(1);
                  Navigator.pop(context);
                },
                isSelect: _selectedIndex == 1,
              ),
              AdminDashboardDrawerItem(
                title: 'Tambah SPP',
                onTap: () {
                  _onItemTapped(2);
                  Navigator.pop(context);
                },
                isSelect: _selectedIndex == 2,
              ),
              AdminDashboardDrawerItem(
                title: 'Lihat Semua SPP',
                onTap: () {
                  _onItemTapped(3);
                  Navigator.pop(context);
                },
                isSelect: _selectedIndex == 3,
              ),
            ],
          ),
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
