import 'package:flutter/material.dart';
import 'package:my_hris/utils/constant/constant_color.dart';
import 'package:my_hris/utils/constant/constant_unit.dart';
import 'package:my_hris/utils/extension/space.dart';
import 'package:my_hris/utils/extension/typography.dart';

class ClockInOutScreen extends StatefulWidget {
  const ClockInOutScreen({super.key});

  @override
  State<ClockInOutScreen> createState() => _ClockInOutScreenState();
}

class _ClockInOutScreenState extends State<ClockInOutScreen> {
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ClockInOutArgument;
    return Scaffold(
      body: Container(
        color: args.failed == false ? successColor : errorColor,
        child: Padding(
          padding: const EdgeInsets.all(pagePadding),
          child: SafeArea(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    iconSize: 44.0,
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close_outlined,
                      color: whiteColor,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: args.failed == false
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            'Clocked At'.xl(
                              1,
                              TextOverflow.ellipsis,
                              color: whiteColor,
                              bold: false,
                              textAlign: TextAlign.center,
                            ),
                            24.0.dp,
                            Text(
                              "${now.hour} : ${now.minute}",
                              style: const TextStyle(
                                fontSize: 44,
                                fontWeight: FontWeight.bold,
                                color: whiteColor,
                              ),
                            ),
                          ],
                        )
                      : 'you are outside the scope of the office'.xl(
                          2,
                          TextOverflow.ellipsis,
                          color: whiteColor,
                          bold: true,
                          textAlign: TextAlign.center,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ClockInOutArgument {
  final bool failed;

  ClockInOutArgument({required this.failed});
}
