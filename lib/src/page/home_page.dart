import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/src/page/expense_page.dart';
import 'package:task/src/page/payment_collector_page.dart';
import 'package:task/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget avatar() {
      return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: hijaumuda,
          ),
        ),
        child: const CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
              'https://s.kaskus.id/images/2021/11/13/11125169_20211113104442.png'),
        ),
      );
    }

    Widget card(String image, String text1, String text2, Color colors,
            Function() ontap) =>
        GestureDetector(
          onTap: ontap,
          child: Container(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 20,
              right: 20,
              left: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: colors,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  image,
                  height: 93,
                  width: 93,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          text1,
                          style: TextStyle(
                            fontFamily: 'KumbhSans',
                            fontSize: 21,
                            color: colors,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          text2,
                          style: TextStyle(
                            fontFamily: 'KumbhSans',
                            fontSize: 8,
                            color: colors,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: colors,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    "assets/svg/Arrow_left.svg",
                    height: 36,
                    width: 36,
                  ),
                )
              ],
            ),
          ),
        );

    return SafeArea(
      child: Scaffold(
        backgroundColor: putih,
        body: Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: ListView(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: avatar(),
              ),
              RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Helloo,\n",
                      style: TextStyle(
                        color: merahtua,
                        fontFamily: 'KumbhSans',
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text: "Rendra\n",
                      style: TextStyle(
                        color: merahtua,
                        fontFamily: 'KumbhSans',
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: "Pilih Kebutuhanmu",
                      style: TextStyle(
                        color: abuabu,
                        fontFamily: 'KumbhSans',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              card(
                "assets/svg/calender.svg",
                "Pengingat\nPembayaran",
                "Buat pengingat waktu pembayaran\nkamu contohnya listrik, Air, dll",
                hijaumuda,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentCollectorPage(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              card(
                "assets/svg/wallet.svg",
                "Catat\nPengeluaran",
                "Kamu bisa mencatat pengeluaran\nkeuangan untuk kontrol keuangan",
                kuning,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExpensePage(),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
                child: card(
                  "assets/svg/cart.svg",
                  "Catat Daftar\nBelanja",
                  "Sebelum kamu berangkat ke toko\nuntuk belanja catat daftar belanja\nagar kamu tidak lupa",
                  hijaumuda,
                  () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
