import 'package:my_hris/core/splash/data/dto/splash_dto.dart';

class SplashLocalDataSource {
  Future<SplashDTO> generateEurekaEdutechLogo(
      final String eurekaEdutechLogoUrl) async {
    return SplashDTO(eurekaEdutechLogoUrl: eurekaEdutechLogoUrl);
  }
}
