import 'package:my_hris/core/splash/data/dto/splash_dto.dart';
import 'package:my_hris/utils/constant/constant_text.dart';

class SplashLocalDataSource {
  Future<SplashDTO> generateEurekaEdutechLogo() async {
    return SplashDTO(eurekaEdutechLogoUrl: eurekaEdutechLogoUrl);
  }
}
