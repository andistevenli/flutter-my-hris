import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_hris/feature/profile/controller/profile_controller.dart';
import 'package:my_hris/feature/profile/widget/info_list.dart';
import 'package:my_hris/feature/widget/box.dart';
import 'package:my_hris/feature/widget/primary_button.dart';
import 'package:my_hris/feature/widget/text_action_button.dart';
import 'package:my_hris/utils/constant/constant_color.dart';
import 'package:my_hris/utils/constant/constant_route.dart';
import 'package:my_hris/utils/constant/constant_unit.dart';
import 'package:my_hris/utils/extension/space.dart';
import 'package:my_hris/utils/extension/typography.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  void logout() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool('logged_in', false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(pagePadding),
          child: Center(
            child: Consumer(
              builder: (context, ref, child) => ref
                  .watch(profileController)
                  .when(
                    data: (data) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //personal info
                                Box(
                                  child: Column(
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
                                        subtitle: data.personalModel.fullName,
                                      ),
                                      8.0.dp,
                                      InfoList(
                                        title: 'Employee Code',
                                        subtitle:
                                            data.personalModel.employeeCode,
                                      ),
                                      8.0.dp,
                                      InfoList(
                                        title: 'Phone Number',
                                        subtitle:
                                            data.personalModel.phoneNumber,
                                      ),
                                      8.0.dp,
                                      InfoList(
                                        title: 'Email',
                                        subtitle: data.personalModel.email,
                                      ),
                                      8.0.dp,
                                      InfoList(
                                        title: 'Gender',
                                        subtitle: data.personalModel.gender,
                                      ),
                                      8.0.dp,
                                      InfoList(
                                        title: 'Religion',
                                        subtitle: data.personalModel.religion,
                                      ),
                                      8.0.dp,
                                      InfoList(
                                        title: 'Marital Status',
                                        subtitle:
                                            data.personalModel.maritalStatus,
                                      ),
                                      8.0.dp,
                                      InfoList(
                                        title: 'Blood Type',
                                        subtitle: data.personalModel.bloodType,
                                      ),
                                      8.0.dp,
                                      InfoList(
                                        title: 'Date of Birth',
                                        subtitle:
                                            data.personalModel.dateOfBirth,
                                      ),
                                      8.0.dp,
                                      InfoList(
                                        title: 'Place of Birth',
                                        subtitle:
                                            data.personalModel.placeOfBirth,
                                      ),
                                    ],
                                  ),
                                ),
                                16.0.dp,
                                //employment info
                                Box(
                                  child: Column(
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
                                        subtitle: data.employmentModel.company,
                                      ),
                                      8.0.dp,
                                      InfoList(
                                        title: 'Department',
                                        subtitle:
                                            data.employmentModel.department,
                                      ),
                                      8.0.dp,
                                      InfoList(
                                        title: 'Position',
                                        subtitle: data.employmentModel.position,
                                      ),
                                      8.0.dp,
                                      InfoList(
                                        title: 'Employee Status',
                                        subtitle:
                                            data.employmentModel.employeeStatus,
                                      ),
                                      8.0.dp,
                                      InfoList(
                                        title: 'Employee Type',
                                        subtitle:
                                            data.employmentModel.employeeType,
                                      ),
                                      8.0.dp,
                                      InfoList(
                                        title: 'Join Date',
                                        subtitle: data.employmentModel.joinDate,
                                      ),
                                      8.0.dp,
                                      InfoList(
                                        title: 'Approval Line',
                                        subtitle:
                                            data.employmentModel.approvalLine,
                                      ),
                                    ],
                                  ),
                                ),
                                16.0.dp,
                                //address info
                                Box(
                                  child: Column(
                                    children: [
                                      'Address'.md(
                                        1,
                                        TextOverflow.ellipsis,
                                        color: greyColor,
                                        bold: true,
                                        textAlign: TextAlign.center,
                                      ),
                                      16.0.dp,
                                      InfoList(
                                        title: 'Residential Address',
                                        subtitle: data
                                            .addressModel.residentialAddress,
                                      ),
                                      8.0.dp,
                                      InfoList(
                                        title: 'Citizen Address',
                                        subtitle:
                                            data.addressModel.citizenAddress,
                                      ),
                                      8.0.dp,
                                      InfoList(
                                        title: 'Province',
                                        subtitle: data.addressModel.province,
                                      ),
                                      8.0.dp,
                                      InfoList(
                                        title: 'City',
                                        subtitle: data.addressModel.city,
                                      ),
                                      8.0.dp,
                                      InfoList(
                                        title: 'PostCode',
                                        subtitle: data.addressModel.postCode,
                                      ),
                                    ],
                                  ),
                                ),
                                16.0.dp,
                                //documents info
                                Box(
                                  child: Column(
                                    children: [
                                      'Documents'.md(
                                        1,
                                        TextOverflow.ellipsis,
                                        color: greyColor,
                                        bold: true,
                                        textAlign: TextAlign.center,
                                      ),
                                      16.0.dp,
                                      InfoList(
                                        title: 'KTP',
                                        subtitle: data.documentsModel.ktp,
                                      ),
                                      8.0.dp,
                                      InfoList(
                                        title: 'KK',
                                        subtitle: data.documentsModel.kk,
                                      ),
                                      8.0.dp,
                                      InfoList(
                                        title: 'BPJS',
                                        subtitle: data.documentsModel.bpjs,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        16.0.dp,
                        Box(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              'Setting'.lg(
                                1,
                                TextOverflow.ellipsis,
                                color: darkGreyColor,
                                bold: true,
                                textAlign: TextAlign.center,
                              ),
                              16.0.dp,
                              PrimaryButton(
                                withIcon: true,
                                icon: Icons.password,
                                text: 'Change Password'.md(
                                  1,
                                  TextOverflow.ellipsis,
                                  color: whiteColor,
                                  bold: true,
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () {},
                              ),
                              16.0.dp,
                              PrimaryButton(
                                withIcon: true,
                                icon: Icons.email,
                                text: 'Change Email'.md(
                                  1,
                                  TextOverflow.ellipsis,
                                  color: whiteColor,
                                  bold: true,
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () {},
                              ),
                              16.0.dp,
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        return primary10Color;
                                      } else {
                                        return whiteColor;
                                      }
                                    },
                                  ),
                                  elevation:
                                      const MaterialStatePropertyAll<double>(0),
                                  shape: MaterialStatePropertyAll<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(borderRadius),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  logout();
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, loginRoute, (route) => false);
                                },
                                child: 'Logout'.md(
                                  1,
                                  TextOverflow.ellipsis,
                                  color: errorColor,
                                  bold: false,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
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
