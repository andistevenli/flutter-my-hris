import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_hris/feature/splash/controller/splash_controller.dart';
import 'package:my_hris/utils/constant/constant_text.dart';
import 'package:my_hris/utils/constant/constant_unit.dart';
import 'package:my_hris/utils/constant/constant_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late final bool _isLoggedIn;

  void checkLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _isLoggedIn = sp.getBool('logged_in') ?? false;
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
    Timer(
      const Duration(milliseconds: 2000),
      () async {
        if (_isLoggedIn) {
          Navigator.pushReplacementNamed(context, dashboardRoute);
        } else {
          Navigator.pushReplacementNamed(context, loginRoute);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) =>
            ref.watch(splashController(eurekaEdutechLogoUrl)).when(
                  data: (data) => SafeArea(
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(borderRadius),
                        child: Image.network(
                          data.eurekaEdutechLogoUrl,
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                  ),
                  error: (error, stackTrace) => const SizedBox(),
                  loading: () => const SizedBox(),
                ),
      ),
    );
  }
}
