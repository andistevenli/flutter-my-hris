import 'package:get_it/get_it.dart';
import 'package:my_hris/core/splash/data/data-source/local/splash_local_data_source.dart.dart';
import 'package:my_hris/core/splash/domain/repository/splash_repo_impl.dart';

final GetIt splashDomainInjector = GetIt.instance;

void splashDomainInjectorSetup() {
  splashDomainInjector.registerLazySingleton(() => SplashLocalDataSource());
  splashDomainInjector.registerLazySingleton(() => SplashRepoImpl());
}
