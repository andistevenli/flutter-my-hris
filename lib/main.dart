import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_hris/utils/constant/constant_text.dart';
import 'package:my_hris/utils/key/navigator_key.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyHris(),
    ),
  );
}

class MyHris extends StatelessWidget {
  const MyHris({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Hris',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      initialRoute: splashRoute,
      routes: {},
    );
  }
}
