import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_hris/feature/company/controller/company_controller.dart';
import 'package:my_hris/feature/profile/widget/info_list.dart';
import 'package:my_hris/feature/widget/box.dart';
import 'package:my_hris/utils/constant/constant_color.dart';
import 'package:my_hris/utils/constant/constant_unit.dart';
import 'package:my_hris/utils/extension/space.dart';
import 'package:my_hris/utils/extension/typography.dart';

class CompanyScreen extends ConsumerStatefulWidget {
  const CompanyScreen({super.key});

  @override
  ConsumerState<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends ConsumerState<CompanyScreen> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as CompanyScreenArgument;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(pagePadding),
          child: Consumer(
            builder: (context, ref, child) {
              if (args.id == 1) {
                return ref.watch(companyGeneralController).when(
                      data: (data) => SingleChildScrollView(
                        child: Column(
                          children: [
                            Box(
                              child: Column(
                                children: [
                                  'Company Information'.md(
                                    1,
                                    TextOverflow.ellipsis,
                                    color: greyColor,
                                    bold: true,
                                    textAlign: TextAlign.center,
                                  ),
                                  16.0.dp,
                                  InfoList(
                                    title: 'Company Name',
                                    subtitle: data
                                        .companyInformationModel.companyName,
                                  ),
                                  8.0.dp,
                                  InfoList(
                                    title: 'Phone Number',
                                    subtitle: data
                                        .companyInformationModel.phoneNumber,
                                  ),
                                  8.0.dp,
                                  InfoList(
                                    title: 'Email',
                                    subtitle:
                                        data.companyInformationModel.email,
                                  ),
                                  8.0.dp,
                                  InfoList(
                                    title: 'Address',
                                    subtitle:
                                        data.companyInformationModel.address,
                                  ),
                                  8.0.dp,
                                  InfoList(
                                    title: 'Province',
                                    subtitle:
                                        data.companyInformationModel.province,
                                  ),
                                  8.0.dp,
                                  InfoList(
                                    title: 'City',
                                    subtitle: data.companyInformationModel.city,
                                  ),
                                ],
                              ),
                            ),
                            16.0.dp,
                            Box(
                              child: Column(
                                children: [
                                  'Tax Information'.md(
                                    1,
                                    TextOverflow.ellipsis,
                                    color: greyColor,
                                    bold: true,
                                    textAlign: TextAlign.center,
                                  ),
                                  16.0.dp,
                                  InfoList(
                                    title: 'Company NPWP',
                                    subtitle:
                                        data.taxInformationModel.companyNPWP,
                                  ),
                                  8.0.dp,
                                  InfoList(
                                    title: 'Taxable Date',
                                    subtitle:
                                        data.taxInformationModel.taxableDate,
                                  ),
                                  8.0.dp,
                                  InfoList(
                                    title: 'Tax Person Name',
                                    subtitle:
                                        data.taxInformationModel.taxPersonName,
                                  ),
                                  8.0.dp,
                                  InfoList(
                                    title: 'Tax Person NPWP',
                                    subtitle:
                                        data.taxInformationModel.taxPersonNPWP,
                                  ),
                                ],
                              ),
                            ),
                            16.0.dp,
                            Box(
                              child: Column(
                                children: [
                                  'Locations'.md(
                                    1,
                                    TextOverflow.ellipsis,
                                    color: greyColor,
                                    bold: true,
                                    textAlign: TextAlign.center,
                                  ),
                                  16.0.dp,
                                  SizedBox(
                                    width: double.infinity,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        'Main Office'.xs(
                                          1,
                                          TextOverflow.ellipsis,
                                          color: greyColor,
                                          bold: false,
                                          textAlign: TextAlign.start,
                                        ),
                                        data.locationModel.address.sm(
                                          4,
                                          TextOverflow.ellipsis,
                                          color: blackColor,
                                          bold: false,
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
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
                    );
              } else if (args.id == 2) {
                return ref.watch(companyDepartmentController).when(
                      data: (data) => ListView.separated(
                        itemBuilder: (context, index) => ListTile(
                          title:
                              '${data[index].departmentName} | ${data[index].status} | ${data[index].employees}'
                                  .md(
                            2,
                            TextOverflow.ellipsis,
                            color: blackColor,
                            bold: true,
                            textAlign: TextAlign.start,
                          ),
                          subtitle: data[index].lead.sm(
                                1,
                                TextOverflow.ellipsis,
                                color: darkGreyColor,
                                bold: false,
                                textAlign: TextAlign.start,
                              ),
                        ),
                        separatorBuilder: (context, index) => 16.0.dp,
                        itemCount: data.length,
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
                    );
              } else {
                return ref.watch(companyPositionController).when(
                      data: (data) => ListView.separated(
                        itemBuilder: (context, index) => ListTile(
                          title:
                              '${data[index].positionName} | ${data[index].employees}'
                                  .md(
                            2,
                            TextOverflow.ellipsis,
                            color: blackColor,
                            bold: true,
                            textAlign: TextAlign.start,
                          ),
                          subtitle: data[index].departmentName.sm(
                                1,
                                TextOverflow.ellipsis,
                                color: darkGreyColor,
                                bold: false,
                                textAlign: TextAlign.start,
                              ),
                        ),
                        separatorBuilder: (context, index) => 16.0.dp,
                        itemCount: data.length,
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
                    );
              }
            },
          ),
        ),
      ),
    );
  }
}

class CompanyScreenArgument {
  final int id;

  CompanyScreenArgument({required this.id});
}
