import 'package:my_hris/core/splash/domain/entity/splash_model.dart';

abstract class ISplashRepo {
  Future<SplashModel> generateEurekaEdutechLogo(
      final String eurekaEdutechLogoUrl);
}
