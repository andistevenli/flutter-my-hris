import 'package:get_it/get_it.dart';
import 'package:my_hris/core/dashboard/domain/use-case/dashboard_interactor.dart';

final GetIt dashboardFeatInjector = GetIt.instance;

void dashboardFeatInjectorSetup() {
  dashboardFeatInjector.registerLazySingleton(() => DashboardInteractor());
}
