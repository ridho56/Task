import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/theme.dart';

class DetailBottomSheet extends StatelessWidget {
  final Map<String, dynamic> data;
  const DetailBottomSheet({super.key, required this.data});

  Map<String, dynamic> get getData => data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 47,
        vertical: 12,
      ),
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(22),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(bottom: 35),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: const Color(0xffEBEBEB),
              ),
              width: 80,
              height: 4,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset("assets/svg/Data.svg"),
              SvgPicture.asset("assets/svg/edit.svg"),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: "${data['name']}\n",
                  style: const TextStyle(
                    color: abuabu,
                    fontFamily: 'KumbhSans',
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: "${data['date']}",
                  style: const TextStyle(
                    color: abuabu,
                    fontFamily: 'KumbhSans',
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          const Text(
            "Deskripsi",
            style: TextStyle(
              color: kuning,
              fontFamily: 'KumbhSans',
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "${data['decription']}",
            textAlign: TextAlign.justify,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'KumbhSans',
              fontSize: 13,
              fontWeight: FontWeight.w400,
              overflow: TextOverflow.clip,
            ),
          ),
          const SizedBox(
            height: 27,
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                backgroundColor: kuning,
                foregroundColor: kuning.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(27),
                ),
                minimumSize: const Size(124, 41),
              ),
              child: const Text(
                "Tutup",
                style: TextStyle(
                  color: putih,
                  fontFamily: 'KumbhSans',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
