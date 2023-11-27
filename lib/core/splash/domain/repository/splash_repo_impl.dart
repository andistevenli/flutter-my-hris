import 'package:my_hris/core/splash/data/data-source/local/splash_local_data_source.dart.dart';
import 'package:my_hris/core/splash/data/repository/splash_repo.dart';
import 'package:my_hris/core/splash/domain/di/splash_domain_injector.dart';
import 'package:my_hris/core/splash/domain/entity/splash_model.dart';

import '../../data/mapper/splash_mapper.dart';

class SplashRepoImpl implements ISplashRepo {
  @override
  Future<SplashModel> generateEurekaEdutechLogo(
      String eurekaEdutechLogoUrl) async {
    return moveToSplashModel(await splashDomainInjector<SplashLocalDataSource>()
        .generateEurekaEdutechLogo(eurekaEdutechLogoUrl));
  }
}
