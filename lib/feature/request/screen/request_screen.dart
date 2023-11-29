import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_hris/feature/request/controller/request_controller.dart';
import 'package:my_hris/feature/widget/box.dart';
import 'package:my_hris/feature/widget/primary_button.dart';
import 'package:my_hris/utils/constant/constant_color.dart';
import 'package:my_hris/utils/constant/constant_unit.dart';
import 'package:my_hris/utils/extension/space.dart';
import 'package:my_hris/utils/extension/typography.dart';

class RequestScreen extends ConsumerStatefulWidget {
  const RequestScreen({super.key});

  @override
  ConsumerState<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends ConsumerState<RequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(pagePadding),
          child: Center(
            child: Consumer(
              builder: (context, ref, child) => ref
                  .watch(requestController)
                  .when(
                    data: (data) => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Box(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              'Based on the company regulations, employees can submit a leave request after one year of employment.'
                                  .sm(
                                4,
                                TextOverflow.ellipsis,
                                color: greyColor,
                                bold: false,
                                textAlign: TextAlign.center,
                              ),
                              16.0.dp,
                              PrimaryButton(
                                withIcon: false,
                                icon: Icons.abc,
                                text: 'Leave'.md(
                                  1,
                                  TextOverflow.ellipsis,
                                  color: whiteColor,
                                  bold: true,
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        16.0.dp,
                        Box(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              'Available Annual Leave'.md(
                                1,
                                TextOverflow.ellipsis,
                                color: greyColor,
                                bold: false,
                                textAlign: TextAlign.center,
                              ),
                              '8 Days'.xl(
                                1,
                                TextOverflow.ellipsis,
                                color: blackColor,
                                bold: true,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        16.0.dp,
                        'Request History'.md(
                          1,
                          TextOverflow.ellipsis,
                          color: greyColor,
                          bold: true,
                          textAlign: TextAlign.center,
                        ),
                        16.0.dp,
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return Box(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    "${data[index].type} | ${data[index].status}"
                                        .md(
                                      1,
                                      TextOverflow.ellipsis,
                                      color: blackColor,
                                      bold: true,
                                      textAlign: TextAlign.center,
                                    ),
                                    8.0.dp,
                                    data[index].reason.sm(
                                          3,
                                          TextOverflow.ellipsis,
                                          color: darkGreyColor,
                                          bold: false,
                                          textAlign: TextAlign.center,
                                        ),
                                    8.0.dp,
                                    SizedBox(
                                      width: double.infinity,
                                      child: data[index].date.xs(
                                            1,
                                            TextOverflow.ellipsis,
                                            color: greyColor,
                                            bold: false,
                                            textAlign: TextAlign.end,
                                          ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => 8.0.dp,
                            itemCount: data.length,
                          ),
                        ),
                      ],
                    ),
                    error: (error, stackTrace) => Center(
                      child: 'Error'.xl(
                        1,
                        TextOverflow.ellipsis,
                        color: errorColor,
                        bold: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: primaryColor,
                      ),
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
