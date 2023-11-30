import 'package:get_it/get_it.dart';
import 'package:my_hris/core/profile/data/data-source/local/profile_local_data_source.dart';
import 'package:my_hris/core/profile/domain/repo/profile_repo_impl.dart';

final GetIt profileDomainInjector = GetIt.instance;

void profileDomainInjectorSetup() {
  profileDomainInjector.registerLazySingleton(() => ProfileLocalDataSource());
  profileDomainInjector.registerLazySingleton(() => ProfileRepoImpl());
}
