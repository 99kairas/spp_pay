import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:spp_pay/shared/shared_methods.dart';
import 'package:spp_pay/shared/theme.dart';
import 'package:spp_pay/ui/screens/riwayat_pembayaran/riwayat_pembayaran_view_model.dart';
import 'package:spp_pay/ui/widgets/riwayat_pembayaran_item.dart';

class RiwayatPembayaranScreen extends StatefulWidget {
  const RiwayatPembayaranScreen({super.key});

  @override
  State<RiwayatPembayaranScreen> createState() =>
      _RiwayatPembayaranScreenState();
}

class _RiwayatPembayaranScreenState extends State<RiwayatPembayaranScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<RiwayatPembayaranViewModel>(context, listen: false)
        .getPembayaran(context);
  }

  @override
  Widget build(BuildContext context) {
    final riwayatProvider = Provider.of<RiwayatPembayaranViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pembayaran'),
      ),
      body: riwayatProvider.isLoading
          ? Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                color: greenColor,
                size: 50,
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              itemCount: riwayatProvider.pembayaran?.length,
              itemBuilder: (context, index) {
                var riwayatSuccess = riwayatProvider.pembayaran?[index];
                return riwayatSuccess?.status == 1
                    ? RiwayatPembayaranItem(
                        tahun: '${riwayatSuccess?.spp?.tahun}',
                        bulan: '${riwayatSuccess?.spp?.bulan}',
                        price: formatCurrency(
                          int.parse('${riwayatSuccess?.spp?.jumlah}'),
                        ),
                        tagihan: riwayatSuccess?.idPembayaran,
                        onTap: () {},
                        isVerified: riwayatSuccess?.status,
                      )
                    : Container();
              },
            ),
    );
  }
}
