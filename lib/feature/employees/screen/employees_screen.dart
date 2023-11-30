import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_hris/feature/employees/controller/employees_controller.dart';
import 'package:my_hris/feature/employees/screen/employees_detail_screen.dart';
import 'package:my_hris/utils/constant/constant_color.dart';
import 'package:my_hris/utils/constant/constant_route.dart';
import 'package:my_hris/utils/constant/constant_unit.dart';
import 'package:my_hris/utils/extension/space.dart';
import 'package:my_hris/utils/extension/typography.dart';

class EmployeesSceen extends ConsumerStatefulWidget {
  const EmployeesSceen({super.key});

  @override
  ConsumerState<EmployeesSceen> createState() => _EmployeesSceenState();
}

class _EmployeesSceenState extends ConsumerState<EmployeesSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(pagePadding),
          child: Consumer(
            builder: (context, ref, child) => ref
                .watch(employeesController)
                .when(
                  data: (data) => ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => ListTile(
                      onTap: () => Navigator.pushNamed(
                        context,
                        employeesDetailRoute,
                        arguments: EmployeeDetailScreenArgument(index: index),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                        side: const BorderSide(width: 2, color: lightGreyColor),
                      ),
                      tileColor: whiteColor,
                      leading: const CircleAvatar(child: Icon(Icons.person)),
                      title: data[index].employeesPersonalModel.fullName.sm(
                            1,
                            TextOverflow.ellipsis,
                            color: blackColor,
                            bold: true,
                            textAlign: TextAlign.start,
                          ),
                      subtitle:
                          data[index].employeesEmploymentModel.position.xs(
                                1,
                                TextOverflow.ellipsis,
                                color: greyColor,
                                bold: false,
                                textAlign: TextAlign.start,
                              ),
                    ),
                    separatorBuilder: (context, index) => 16.0.dp,
                    itemCount: data.length,
                  ),
                  error: (error, stacktrace) => Center(
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
