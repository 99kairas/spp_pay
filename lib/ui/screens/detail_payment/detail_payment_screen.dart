import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:spp_pay/shared/shared_methods.dart';
import 'package:spp_pay/shared/theme.dart';
import 'package:spp_pay/ui/screens/detail_payment/detail_payment_view_model.dart';
import 'package:spp_pay/ui/screens/metode_pembayaran/metode_pembayaran_screen.dart';
import 'package:spp_pay/ui/widgets/buttons.dart';

class DetailPaymentScreen extends StatefulWidget {
  final String? idPembayaran;
  final String? image;
  const DetailPaymentScreen({
    super.key,
    this.idPembayaran,
    this.image,
  });

  @override
  State<DetailPaymentScreen> createState() => _DetailPaymentScreenState();
}

class _DetailPaymentScreenState extends State<DetailPaymentScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<DetailPaymentViewModel>(context, listen: false)
        .getDetailPayment(idPembayaran: widget.idPembayaran);
  }

  @override
  Widget build(BuildContext context) {
    final detailPaymentProvider = Provider.of<DetailPaymentViewModel>(context);
    var payment = detailPaymentProvider.listPayment;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rincian Pembayaran'),
      ),
      body: detailPaymentProvider.isLoading
          ? Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                color: greenColor,
                size: 50,
              ),
            )
          : ListView(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const SizedBox(height: 25),
                Text(
                  'Pembayaran',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  width: 327,
                  height: 303,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: greyColor,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          payment?.spp?.tahun ?? "",
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                      ),
                      const SizedBox(height: 34),
                      Text(
                        '${payment?.siswa?.namaSiswa}',
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: regular,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${payment?.siswa?.kelas}',
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: regular,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        payment?.noIndukSiswa ?? "",
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: regular,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 28),
                      Center(
                        child: Text(
                          'No Tagihan : ${payment?.idPembayaran ?? ""} ',
                          style: blackTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: medium,
                          ),
                        ),
                      ),
                      const SizedBox(height: 42),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Bulan\n${payment?.spp?.bulan}',
                            style: blackTextStyle.copyWith(
                              fontSize: 14,
                              letterSpacing: 1,
                              fontWeight: regular,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            formatCurrency(
                                int.parse(payment?.spp?.jumlah ?? "")),
                            style: greyTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: medium,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.375),
                CustomFilledButton(
                  title: 'Bayar',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MetodePembayaranScreen(
                            idPembayaran: payment?.idPembayaran.toString(),
                          ),
                        ));
                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
    );
  }
}
