import 'package:get_it/get_it.dart';
import 'package:my_hris/core/dashboard/data/data-source/local/dashboard_local_data_source.dart';
import 'package:my_hris/core/dashboard/data/data-source/remote/dashboard_remote_data_source.dart';
import 'package:my_hris/core/dashboard/domain/repository/dashboard_repo_impl.dart';

final GetIt dashboardDomainInjector = GetIt.instance;

void dashboardDomainInjectorSetup() {
  dashboardDomainInjector
      .registerLazySingleton(() => DashboardLocalDataSource());
  dashboardDomainInjector
      .registerLazySingleton(() => DashboardRemoteDataSource());
  dashboardDomainInjector.registerLazySingleton(() => DashboardRepoImpl());
}
