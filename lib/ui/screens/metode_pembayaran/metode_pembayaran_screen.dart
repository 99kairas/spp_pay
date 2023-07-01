import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:spp_pay/shared/theme.dart';
import 'package:spp_pay/ui/screens/metode_pembayaran/metode_pembayaran_view_model.dart';
import 'package:spp_pay/ui/widgets/metode_pembayaran_text.dart';

class MetodePembayaranScreen extends StatefulWidget {
  final String? idPembayaran;
  final String? image;
  const MetodePembayaranScreen({
    super.key,
    this.idPembayaran,
    this.image,
  });

  @override
  State<MetodePembayaranScreen> createState() => _MetodePembayaranScreenState();
}

class _MetodePembayaranScreenState extends State<MetodePembayaranScreen> {
  bool? isManual;
  bool? isTransfer;

  @override
  void initState() {
    super.initState();
    Provider.of<MetodePembayaranViewModel>(context, listen: false)
        .getDetailPayment(idPembayaran: widget.idPembayaran);
  }

  @override
  Widget build(BuildContext context) {
    final paymentMethodProvider =
        Provider.of<MetodePembayaranViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metode Pembayaran'),
      ),
      body: paymentMethodProvider.isLoading
          ? Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                color: greenColor,
                size: 50,
              ),
            )
          : ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isManual = true;
                          isTransfer = false;
                        });
                      },
                      child: Container(
                        width: 143,
                        height: 51,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(
                            width: 2,
                            color: isManual == true ? blackColor : greyColor,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            'Manual',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isManual = false;
                          isTransfer = true;
                        });
                      },
                      child: Container(
                        width: 143,
                        height: 51,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(
                            width: 2,
                            color: isTransfer == true ? blackColor : greyColor,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            'Transfer',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (isManual == true) buildManual(),
                if (isTransfer == true) buildTransfer(context)
              ],
            ),
    );
  }

  Widget buildManual() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tata Cara\nPembayaran Manual / Tunai',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 20),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MetodePembayaranText(title: '1. Datang ke sekolah'),
              MetodePembayaranText(
                  title:
                      '2. Kunjungi ruangan Tata Usaha di jam operasional yaitu jam 08.00 s/d 17.00'),
              MetodePembayaranText(
                  title:
                      '3. Melakukan pembayaran sesuai jumlah yang akan dibantu dengan petugas administrasi'),
              MetodePembayaranText(
                  title: '4. Kartu iuran akan dicap oleh petugas administrasi'),
              MetodePembayaranText(
                  title:
                      '5. Wali murid diharapkan langsung pulang agar tidak terjadi keramaian'),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTransfer(BuildContext context) {
    final paymentMethodProvider =
        Provider.of<MetodePembayaranViewModel>(context);

    print('IMAGES ${paymentMethodProvider.image}');
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tata Cara\nPembayaran Transfer',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 10),
          const MetodePembayaranText(
              title:
                  '1. Sebelum melakukan pembayaran menggunakan Transfer, pastikan jumlah yang dimasukkan sesuai'),
          const MetodePembayaranText(
              title: '2. Transfer ke salah satu nomor rekening di bawah ini :'),
          const MetodePembayaranText(
              title: ' - BCA, 	5410425652 a.n SDI Teladan Suci'),
          const MetodePembayaranText(
              title: ' - BRI, 	6455-01-002538-53-3 a.n Yayasan Teladan Suci'),
          const MetodePembayaranText(
              title:
                  '3. Setelah melakukan pembayaran, screenshot bukti pembayaran tersebut lalu kirimkan melalui menu dibawah :'),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Center(
            child: Container(
              width: 127,
              height: 120,
              decoration: BoxDecoration(
                color: lightBackgroundColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: greyColor,
                  width: 1,
                ),
              ),
              child: paymentMethodProvider.image == null
                  ? InkWell(
                      onTap: () {
                        paymentMethodProvider.uploadImage(
                          context: context,
                          idPembayaran: widget.idPembayaran,
                        );
                      },
                      child: Center(
                        child: Image.asset(
                          'assets/ic_upload.png',
                          width: 32,
                          height: 32,
                        ),
                      ),
                    )
                  : Image.network(paymentMethodProvider.image ?? ""),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          const MetodePembayaranText(
              title:
                  'Note : Bukti pembayaran akan terhapus secara otomatis jika bukti tidak valid\napabila terhapus maka wali murid diwajibkan untuk mengupload ulang'),
        ],
      ),
    );
  }
}
