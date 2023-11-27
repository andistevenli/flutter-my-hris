import 'package:my_hris/core/splash/domain/di/splash_domain_injector.dart';
import 'package:my_hris/core/splash/domain/entity/splash_model.dart';
import 'package:my_hris/core/splash/domain/repository/splash_repo_impl.dart';
import 'package:my_hris/core/splash/domain/use-case/splash_use_case.dart';

class SplashInteractor implements SplashUseCase {
  @override
  Future<SplashModel> generateEurekaEdutechLogo() async {
    return await splashDomainInjector<SplashRepoImpl>()
        .generateEurekaEdutechLogo();
  }
}
