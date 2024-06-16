import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/src/widget/detail_data.dart';
import 'package:task/theme.dart';

class PaymentCollectorPage extends StatefulWidget {
  const PaymentCollectorPage({super.key});

  @override
  State<PaymentCollectorPage> createState() => _PaymentCollectorPageState();
}

class _PaymentCollectorPageState extends State<PaymentCollectorPage> {
  @override
  Widget build(BuildContext context) {
    Widget contenttop() {
      return Container(
        padding: const EdgeInsets.only(
          top: 20,
          left: 22,
          right: 10,
        ),
        height: 290,
        child: Stack(
          children: [
            //?tombol back
            Positioned(
              top: 0,
              left: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: hijaumuda.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/svg/Arrow_right.svg",
                      width: 24,
                      height: 24,
                      theme: const SvgTheme(
                        currentColor: hijaumuda,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //?background
            Positioned(
              top: 0,
              right: 0,
              child: SvgPicture.asset(
                'assets/svg/background_payment.svg',
                height: 184,
                width: 184,
                fit: BoxFit.scaleDown,
              ),
            ),
            const Positioned(
              top: 75,
              left: 0,
              right: 42,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pengingat",
                    style: TextStyle(
                      color: abuabu,
                      fontFamily: 'KumbhSans',
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // SvgPicture.asset("assets/svg/filter-search.svg"),
                ],
              ),
            ),
            Positioned(
              top: 130,
              right: 22,
              left: 0,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 16,
                  bottom: 24,
                  left: 26,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: hijaumuda,
                  ),
                  color: putih,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Total\n",
                            style: TextStyle(
                              color: hijaumuda,
                              fontFamily: 'KumbhSans',
                              fontSize: 19,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: "Rp 1.500.000\n",
                            style: TextStyle(
                              color: hitam,
                              fontFamily: 'KumbhSans',
                              fontSize: 36,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: "Sampai Hari Ini 20 November 2023",
                            style: TextStyle(
                              color: hitam,
                              fontFamily: 'KumbhSans',
                              fontSize: 9,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget contentmid() {
      return Container(
        padding: const EdgeInsets.only(
          left: 22,
          right: 32,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Rincian",
              style: TextStyle(
                color: abuabu,
                fontFamily: 'KumbhSans',
                fontSize: 21,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  backgroundColor: hijaumuda,
                  foregroundColor: hijaumuda.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(27),
                  ),
                  minimumSize: const Size(126, 35)),
              child: const Text(
                "Tambah +",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: putih,
                  fontFamily: 'KumbhSans',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget contentboottom() {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 27,
            left: 22,
            right: 32,
          ),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              final color = getColorByIndex(index);
              return GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return const DetailBottomSheet();
                    },
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 11),
                  padding: const EdgeInsets.only(
                      left: 12, top: 10, bottom: 10, right: 28),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27),
                    color: color,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("assets/svg/Data.svg"),
                          RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Paket Data\n",
                                  style: TextStyle(
                                    color: abuabu,
                                    fontFamily: 'KumbhSans',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: "19 November 2023",
                                  style: TextStyle(
                                    color: abuabu,
                                    fontFamily: 'KumbhSans',
                                    fontSize: 9,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "Rp 75.000",
                        style: TextStyle(
                          color: abuabu,
                          fontFamily: 'KumbhSans',
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: putih,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //?top
            contenttop(),
            //?mid
            contentmid(),
            //?bottom
            contentboottom(),
          ],
        ),
      ),
    );
  }
}
