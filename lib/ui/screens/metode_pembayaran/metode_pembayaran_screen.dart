import 'package:flutter/material.dart';
import 'package:spp_pay/shared/theme.dart';
import 'package:spp_pay/ui/widgets/buttons.dart';
import 'package:spp_pay/ui/widgets/metode_pembayaran_text.dart';

class MetodePembayaranScreen extends StatefulWidget {
  final String? idPembayaran;

  const MetodePembayaranScreen({
    super.key,
    this.idPembayaran,
  });

  @override
  State<MetodePembayaranScreen> createState() => _MetodePembayaranScreenState();
}

class _MetodePembayaranScreenState extends State<MetodePembayaranScreen> {
  bool? isManual;
  bool? isTransfer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metode Pembayaran'),
      ),
      body: ListView(
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
          if (isTransfer == true) buildTransfer()
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
                      '3. Melakukan pembayaran sesuai jumlah dibantu dengan petugas administrasi'),
              MetodePembayaranText(
                  title: '4. Kartu iuran akan dicap oleh petugas administrasi'),
              MetodePembayaranText(
                  title: '5. Wali murid diharapkan langsung pulang agar tidak terjadi keramaian'),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTransfer() {
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.65),
          CustomFilledButton(
            title: 'Upload Bukti Pembayaran',
            onPressed: () {},
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
