import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_hris/feature/employees/controller/employees_controller.dart';
import 'package:my_hris/feature/profile/widget/info_list.dart';
import 'package:my_hris/feature/widget/box.dart';
import 'package:my_hris/feature/widget/text_action_button.dart';
import 'package:my_hris/utils/constant/constant_color.dart';
import 'package:my_hris/utils/constant/constant_unit.dart';
import 'package:my_hris/utils/extension/space.dart';
import 'package:my_hris/utils/extension/typography.dart';

class EmployeesDetailScreen extends ConsumerStatefulWidget {
  const EmployeesDetailScreen({super.key});

  @override
  ConsumerState<EmployeesDetailScreen> createState() =>
      _EmployeesDetailScreenState();
}

class _EmployeesDetailScreenState extends ConsumerState<EmployeesDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as EmployeeDetailScreenArgument;
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(pagePadding),
          child: Consumer(
            builder: (context, ref, child) => ref
                .watch(
                  employeesDetailController(args.index),
                )
                .when(
                  data: (data) => SingleChildScrollView(
                    child: Column(
                      children: [
                        Box(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              'Personal'.md(
                                1,
                                TextOverflow.ellipsis,
                                color: greyColor,
                                bold: true,
                                textAlign: TextAlign.center,
                              ),
                              16.0.dp,
                              InfoList(
                                title: 'Fullname',
                                subtitle: data.employeesPersonalModel.fullName,
                              ),
                              8.0.dp,
                              InfoList(
                                title: 'Employee Code',
                                subtitle:
                                    data.employeesPersonalModel.employeeCode,
                              ),
                              8.0.dp,
                              InfoList(
                                title: 'Email',
                                subtitle: data.employeesPersonalModel.email,
                              ),
                              8.0.dp,
                              InfoList(
                                title: 'Gender',
                                subtitle: data.employeesPersonalModel.gender,
                              ),
                              8.0.dp,
                              InfoList(
                                title: 'Religion',
                                subtitle: data.employeesPersonalModel.religion,
                              ),
                              8.0.dp,
                              InfoList(
                                title: 'Marital Status',
                                subtitle:
                                    data.employeesPersonalModel.maritalStatus,
                              ),
                              8.0.dp,
                              InfoList(
                                title: 'Blood Type',
                                subtitle: data.employeesPersonalModel.bloodType,
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
                              'Employment'.md(
                                1,
                                TextOverflow.ellipsis,
                                color: greyColor,
                                bold: true,
                                textAlign: TextAlign.center,
                              ),
                              16.0.dp,
                              InfoList(
                                title: 'Company',
                                subtitle: data.employeesEmploymentModel.company,
                              ),
                              8.0.dp,
                              InfoList(
                                title: 'Department',
                                subtitle:
                                    data.employeesEmploymentModel.department,
                              ),
                              8.0.dp,
                              InfoList(
                                title: 'Position',
                                subtitle:
                                    data.employeesEmploymentModel.position,
                              ),
                              8.0.dp,
                              InfoList(
                                title: 'Employee Status',
                                subtitle: data
                                    .employeesEmploymentModel.employeeStatus,
                              ),
                              8.0.dp,
                              InfoList(
                                title: 'Employee Type',
                                subtitle:
                                    data.employeesEmploymentModel.employeeType,
                              ),
                              8.0.dp,
                              InfoList(
                                title: 'Join Date',
                                subtitle:
                                    data.employeesEmploymentModel.joinDate,
                              ),
                              8.0.dp,
                              SizedBox(
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    'Approval Line'.xs(
                                      1,
                                      TextOverflow.ellipsis,
                                      color: greyColor,
                                      bold: false,
                                      textAlign: TextAlign.start,
                                    ),
                                    TextActionButton(
                                      text: data.employeesEmploymentModel
                                          .approvalLine,
                                      bgColor: whiteColor,
                                      onPressed: () {},
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
                ),
          ),
        ),
      ),
    );
  }
}

class EmployeeDetailScreenArgument {
  final int index;

  EmployeeDetailScreenArgument({
    required this.index,
  });
}
