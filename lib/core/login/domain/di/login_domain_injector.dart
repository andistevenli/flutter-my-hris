import 'package:get_it/get_it.dart';
import 'package:my_hris/core/login/data/data-source/local/login_local_data_source.dart';
import 'package:my_hris/core/login/domain/repository/login_repo_impl.dart';

final GetIt loginDomainInjector = GetIt.instance;

void loginDomainInjectorSetup() {
  loginDomainInjector.registerLazySingleton(
    () => LoginLocalDataSource(),
  );
  loginDomainInjector.registerLazySingleton(
    () => LoginRepoImpl(),
  );
}
