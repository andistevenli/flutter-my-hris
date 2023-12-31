import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_hris/core/dashboard/domain/entity/user_location_model.dart';
import 'package:my_hris/core/dashboard/domain/use-case/dashboard_interactor.dart';
import 'package:my_hris/feature/company/screen/company_screen.dart';
import 'package:my_hris/feature/dashboard/controller/dashboard_controller.dart';
import 'package:my_hris/feature/dashboard/di/dashboard_feat_injector.dart';
import 'package:my_hris/feature/dashboard/screen/clock_in_out_screen.dart';
import 'package:my_hris/feature/dashboard/widget/location_dialog.dart';
import 'package:my_hris/feature/widget/box.dart';
import 'package:my_hris/feature/widget/custom_bottom_sheet_builder.dart';
import 'package:my_hris/feature/widget/primary_button.dart';
import 'package:my_hris/utils/constant/constant_color.dart';
import 'package:my_hris/utils/constant/constant_route.dart';
import 'package:my_hris/utils/constant/constant_text.dart';
import 'package:my_hris/utils/constant/constant_unit.dart';
import 'package:my_hris/utils/extension/space.dart';
import 'package:my_hris/utils/extension/typography.dart';
import 'package:my_hris/utils/math/calculate_distance.dart';
// import 'package:my_hris/utils/math/calculate_distance.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  bool _isFinished = false;
  late SharedPreferences sp;
  final DateTime now = DateTime.now();
  late String greeting;
  UserLocationModel location = UserLocationModel(
    userLongitude: 0,
    userLatitude: 0,
    targetLongitude: 0,
    targetLatitude: 0,
    address: '',
  );

  @override
  void initState() {
    super.initState();
    askingLocationPermission();
  }

  void checkPresentStatus() async {
    sp = await SharedPreferences.getInstance();
  }

  void askingLocationPermission() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
  }

  void getCurrentLocation() async {
    location =
        await dashboardFeatInjector<DashboardInteractor>().getCurrentLocation();
  }

  Future<void> _launchUrl() async {
    Uri url = Uri.parse(eurekaHrisDocsUrl);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(pagePadding),
          child: Stack(
            children: [
              Consumer(
                builder: (context, ref, child) => ref
                    .watch(dashboardController)
                    .when(
                      data: (data) => Padding(
                        padding: const EdgeInsets.only(bottom: 80),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Box(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        data.greeting.md(
                                          1,
                                          TextOverflow.ellipsis,
                                          color: greyColor,
                                          bold: false,
                                          textAlign: TextAlign.center,
                                        ),
                                        data.name.xl(
                                          1,
                                          TextOverflow.ellipsis,
                                          color: primaryColor,
                                          bold: true,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    16.0.dp,
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: _launchUrl,
                                          icon: const Icon(
                                            Icons.help,
                                            size: 24,
                                            color: primaryColor,
                                          ),
                                        ),
                                        16.0.dp,
                                        IconButton(
                                          onPressed: () {
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (context) {
                                                return CustomBottomSheetBuilder(
                                                  title: 'Your Profile',
                                                  content: [
                                                    const CircleAvatar(
                                                      radius: 50,
                                                      backgroundColor:
                                                          infoColor, // Set the background color
                                                      child: Icon(
                                                        Icons
                                                            .person, // You can also add an icon or text as a child
                                                        size: 50,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    16.0.dp,
                                                    data.name.xl(
                                                      1,
                                                      TextOverflow.ellipsis,
                                                      color: blackColor,
                                                      bold: true,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    data.position.md(
                                                      1,
                                                      TextOverflow.ellipsis,
                                                      color: greyColor,
                                                      bold: false,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    16.0.dp,
                                                    PrimaryButton(
                                                      withIcon: true,
                                                      icon: Icons.person,
                                                      text: 'Detail Profile'.md(
                                                        1,
                                                        TextOverflow.ellipsis,
                                                        color: whiteColor,
                                                        bold: true,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      onPressed: () =>
                                                          Navigator.pushNamed(
                                                              context,
                                                              profileRoute),
                                                    ),
                                                    16.0.dp,
                                                    PrimaryButton(
                                                      withIcon: true,
                                                      icon: Icons.description,
                                                      text: 'Documentation'.md(
                                                        1,
                                                        TextOverflow.ellipsis,
                                                        color: whiteColor,
                                                        bold: true,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      onPressed: _launchUrl,
                                                    ),
                                                    16.0.dp,
                                                    PrimaryButton(
                                                      withIcon: true,
                                                      icon: Icons.contact_page,
                                                      text: 'Contact'.md(
                                                        1,
                                                        TextOverflow.ellipsis,
                                                        color: whiteColor,
                                                        bold: true,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      onPressed: () =>
                                                          Navigator.pushNamed(
                                                              context,
                                                              contactRoute),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.person,
                                            size: 24,
                                            color: primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              24.0.dp,
                              Box(
                                child: Column(
                                  children: [
                                    'Have a request ?'.md(
                                      1,
                                      TextOverflow.ellipsis,
                                      color: greyColor,
                                      bold: false,
                                      textAlign: TextAlign.center,
                                    ),
                                    16.0.dp,
                                    PrimaryButton(
                                      withIcon: false,
                                      icon: Icons.add,
                                      text: 'Request'.md(
                                          1, TextOverflow.ellipsis,
                                          color: whiteColor,
                                          bold: true,
                                          textAlign: TextAlign.center),
                                      onPressed: () {
                                        getCurrentLocation();
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (context) {
                                            return LocationDialog(
                                              userLocationModel: location,
                                              onPressed: () {
                                                Navigator.pop(context);
                                                Navigator.pushNamed(
                                                    context, requestRoute);
                                              },
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              24.0.dp,
                              Box(
                                child: Column(
                                  children: [
                                    'About'.sm(
                                      1,
                                      TextOverflow.ellipsis,
                                      color: greyColor,
                                      bold: true,
                                      textAlign: TextAlign.center,
                                    ),
                                    16.0.dp,
                                    PrimaryButton(
                                      withIcon: false,
                                      icon: Icons.abc,
                                      text: 'Company'.md(
                                        1,
                                        TextOverflow.ellipsis,
                                        color: whiteColor,
                                        bold: true,
                                        textAlign: TextAlign.center,
                                      ),
                                      onPressed: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return CustomBottomSheetBuilder(
                                              title: 'Company',
                                              content: [
                                                PrimaryButton(
                                                  withIcon: false,
                                                  icon: Icons.abc,
                                                  text: 'General'.md(
                                                    1,
                                                    TextOverflow.ellipsis,
                                                    color: whiteColor,
                                                    bold: true,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  onPressed: () =>
                                                      Navigator.pushNamed(
                                                    context,
                                                    companyRoute,
                                                    arguments:
                                                        CompanyScreenArgument(
                                                      id: 1,
                                                    ),
                                                  ),
                                                ),
                                                16.0.dp,
                                                PrimaryButton(
                                                  withIcon: false,
                                                  icon: Icons.abc,
                                                  text: 'Department'.md(
                                                    1,
                                                    TextOverflow.ellipsis,
                                                    color: whiteColor,
                                                    bold: true,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  onPressed: () =>
                                                      Navigator.pushNamed(
                                                    context,
                                                    companyRoute,
                                                    arguments:
                                                        CompanyScreenArgument(
                                                      id: 2,
                                                    ),
                                                  ),
                                                ),
                                                16.0.dp,
                                                PrimaryButton(
                                                  withIcon: false,
                                                  icon: Icons.abc,
                                                  text: 'Position'.md(
                                                    1,
                                                    TextOverflow.ellipsis,
                                                    color: whiteColor,
                                                    bold: true,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  onPressed: () =>
                                                      Navigator.pushNamed(
                                                    context,
                                                    companyRoute,
                                                    arguments:
                                                        CompanyScreenArgument(
                                                      id: 3,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    16.0.dp,
                                    PrimaryButton(
                                      withIcon: false,
                                      icon: Icons.abc,
                                      text: 'Employee'.md(
                                        1,
                                        TextOverflow.ellipsis,
                                        color: whiteColor,
                                        bold: true,
                                        textAlign: TextAlign.center,
                                      ),
                                      onPressed: () => Navigator.pushNamed(
                                          context, employeesRoute),
                                    ),
                                  ],
                                ),
                              ),
                              24.0.dp,
                              Box(
                                child: Builder(
                                  builder: (context) {
                                    final List<Map> chartData = [
                                      {
                                        "month": "June/23",
                                        "employees": 2,
                                      },
                                      {
                                        "month": "July/23",
                                        "employees": 6,
                                      },
                                      {
                                        "month": "November/23",
                                        "employees": data.currentEmployees,
                                      },
                                    ];
                                    return Container(
                                      color: Theme.of(context).cardColor,
                                      child: SfCartesianChart(
                                        isTransposed: true,
                                        primaryXAxis: CategoryAxis(),
                                        series: <ChartSeries>[
                                          BarSeries<Map, String>(
                                            dataSource: chartData,
                                            xValueMapper: (Map data, _) =>
                                                data["month"],
                                            yValueMapper: (Map data, _) =>
                                                data["employees"],
                                            color: infoColor,
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              24.0.dp,
                              Box(
                                child: Builder(
                                  builder: (context) {
                                    final List<Map> chartData = [
                                      {
                                        "gender": "Male",
                                        "employees": data.maleQty,
                                      },
                                      {
                                        "gender": "Female",
                                        "employees": data.femaleQty,
                                      },
                                    ];
                                    return Container(
                                      color: Theme.of(context).cardColor,
                                      padding: const EdgeInsets.all(12.0),
                                      child: SfCircularChart(
                                        legend: const Legend(isVisible: true),
                                        series: <CircularSeries>[
                                          PieSeries<Map, String>(
                                            dataSource: chartData,
                                            dataLabelSettings:
                                                const DataLabelSettings(
                                              isVisible: true,
                                            ),
                                            xValueMapper: (Map data, _) =>
                                                data["gender"],
                                            yValueMapper: (Map data, _) =>
                                                data["employees"],
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              24.0.dp,
                              Box(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    data.activeEmployees == 0
                                        ? 'No'.xl(
                                            1,
                                            TextOverflow.ellipsis,
                                            color: successColor,
                                            bold: true,
                                            textAlign: TextAlign.center,
                                          )
                                        : data.activeEmployees.toString().xl(
                                              1,
                                              TextOverflow.ellipsis,
                                              color: successColor,
                                              bold: true,
                                              textAlign: TextAlign.center,
                                            ),
                                    data.activeEmployees == 0 ||
                                            data.activeEmployees == 1
                                        ? 'Active Employee'.sm(
                                            3,
                                            TextOverflow.ellipsis,
                                            color: greyColor,
                                            bold: false,
                                            textAlign: TextAlign.center,
                                          )
                                        : 'Active Employees'.sm(
                                            3,
                                            TextOverflow.ellipsis,
                                            color: greyColor,
                                            bold: false,
                                            textAlign: TextAlign.center,
                                          ),
                                  ],
                                ),
                              ),
                              24.0.dp,
                              Box(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    data.inactiveEmployees == 0
                                        ? 'No'.xl(
                                            1,
                                            TextOverflow.ellipsis,
                                            color: errorColor,
                                            bold: true,
                                            textAlign: TextAlign.center,
                                          )
                                        : data.inactiveEmployees.toString().xl(
                                              1,
                                              TextOverflow.ellipsis,
                                              color: errorColor,
                                              bold: true,
                                              textAlign: TextAlign.center,
                                            ),
                                    data.inactiveEmployees == 0 ||
                                            data.inactiveEmployees == 1
                                        ? 'Inactive Employee'.sm(
                                            3,
                                            TextOverflow.ellipsis,
                                            color: greyColor,
                                            bold: false,
                                            textAlign: TextAlign.center,
                                          )
                                        : 'Inactive Employees'.sm(
                                            3,
                                            TextOverflow.ellipsis,
                                            color: greyColor,
                                            bold: false,
                                            textAlign: TextAlign.center,
                                          ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
                        child: CircularProgressIndicator(),
                      ),
                    ),
              ),
              // Consumer(
              //   builder: (context, ref, child) => ref
              //       .watch(dashboardLocationController)
              //       .when(
              //         data: (data) => Align(
              //           alignment: Alignment.bottomCenter,
              //           child: SwipeableButtonView(
              //             buttonText: present,
              //             buttonWidget: const Icon(
              //               Icons.arrow_forward_ios_rounded,
              //               color: successColor,
              //             ),
              //             activeColor: successColor,
              //             isFinished: _isFinished,
              //             onWaitingProcess: () {
              //               Future.delayed(const Duration(seconds: 1), () {
              //                 setState(() {
              //                   _isFinished = true;
              //                 });
              //               });
              //             },
              //             onFinish: () async {
              //               // final double distance = calculateDistance(
              //               //   userLocationModel.userLatitude,
              //               //   userLocationModel.userLongitude,
              //               //   userLocationModel.targetLatitude,
              //               //   userLocationModel.targetLongitude,
              //               // );
              //               await Navigator.pushNamed(context, clockInOutRoute,
              //                   arguments: ClockInOutArgument(failed: false));
              //               setState(() {
              //                 _isFinished = false;
              //               });
              //             },
              //           ),
              //         ),
              //         error: (error, stackTrace) => Align(
              //           alignment: Alignment.bottomCenter,
              //           child: 'Error'.xl(
              //             1,
              //             TextOverflow.ellipsis,
              //             color: errorColor,
              //             bold: true,
              //             textAlign: TextAlign.center,
              //           ),
              //         ),
              //         loading: () => const Align(
              //           alignment: Alignment.bottomCenter,
              //           child: CircularProgressIndicator(),
              //         ),
              //       ),
              // ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SwipeableButtonView(
                  buttonText: present,
                  buttonWidget: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: successColor,
                  ),
                  activeColor: successColor,
                  isFinished: _isFinished,
                  onWaitingProcess: () {
                    Future.delayed(const Duration(seconds: 1), () {
                      setState(() {
                        _isFinished = true;
                      });
                    });
                  },
                  onFinish: () async {
                    getCurrentLocation();
                    final double distance = calculateDistance(
                      location.userLatitude,
                      location.userLongitude,
                      location.targetLatitude,
                      location.targetLongitude,
                    );
                    await Navigator.pushNamed(context, clockInOutRoute,
                        arguments: ClockInOutArgument(failed: distance > 1 ? true : false));
                    setState(() {
                      _isFinished = false;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
