import 'package:flutter/material.dart';
import 'package:my_hris/feature/widget/box.dart';
import 'package:my_hris/utils/constant/constant_color.dart';
import 'package:my_hris/utils/constant/constant_unit.dart';
import 'package:my_hris/utils/extension/space.dart';
import 'package:my_hris/utils/extension/typography.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(pagePadding),
          child: Box(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                'Contact'.md(
                  1,
                  TextOverflow.ellipsis,
                  color: blackColor,
                  bold: true,
                  textAlign: TextAlign.start,
                ),
                16.0.dp,
                'For any inquiries or questions, please feel free to reach out to us using the following contact details:'
                    .sm(
                  3,
                  TextOverflow.ellipsis,
                  color: blackColor,
                  bold: false,
                  textAlign: TextAlign.start,
                ),
                4.0.dp,
                '• Email: tech@eurekaedutech.com'.sm(
                  3,
                  TextOverflow.ellipsis,
                  color: blackColor,
                  bold: false,
                  textAlign: TextAlign.start,
                ),
                4.0.dp,
                '• Phone: +6287887056115'.sm(
                  3,
                  TextOverflow.ellipsis,
                  color: blackColor,
                  bold: false,
                  textAlign: TextAlign.start,
                ),
                4.0.dp,
                '• Address: Jalan Fatmawati, Gedung Graha Satria 1 Suite 203, Cilandak Barat, Jakarta 12430, ID'
                    .sm(
                  3,
                  TextOverflow.ellipsis,
                  color: blackColor,
                  bold: false,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
