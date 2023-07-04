import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spp_pay/ui/screens/admin_dashboard/admin_dashboard_view_model.dart';

class AdminShowAllPembayaran extends StatefulWidget {
  const AdminShowAllPembayaran({super.key});

  @override
  State<AdminShowAllPembayaran> createState() => _AdminShowAllPembayaranState();
}

class _AdminShowAllPembayaranState extends State<AdminShowAllPembayaran> {
  @override
  void initState() {
    super.initState();
    Provider.of<AdminDashboardViewModel>(context, listen: false)
        .getAllPembayaran();
  }

  @override
  Widget build(BuildContext context) {
    final adminDashboardProvider =
        Provider.of<AdminDashboardViewModel>(context);

    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: adminDashboardProvider.allPembayaran?.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var allPembayaran = adminDashboardProvider.allPembayaran?[index];
          return Container(
            child: Text('${allPembayaran?.spp?.tahun}'),
          );
        },
      ),
    );
  }
}
