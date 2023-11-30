import 'package:get_it/get_it.dart';
import 'package:my_hris/core/request/data/data-source/local/request_local_data_source.dart';
import 'package:my_hris/core/request/domain/repo/request_repo_impl.dart';

final GetIt requestDomainInjector = GetIt.instance;

void requestDomainInjectorSetup() {
  requestDomainInjector.registerLazySingleton(() => RequestLocalDataSource());
  requestDomainInjector.registerLazySingleton(() => RequestRepoImpl());
}
