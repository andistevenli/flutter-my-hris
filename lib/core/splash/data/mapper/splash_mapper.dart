import 'package:my_hris/core/splash/data/dto/splash_dto.dart';
import 'package:my_hris/core/splash/domain/entity/splash_model.dart';

SplashModel moveToSplashModel(SplashDTO from) {
  return SplashModel(
    eurekaEdutechLogoUrl: from.eurekaEdutechLogoUrl,
  );
}
