import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_hris/core/dashboard/domain/entity/dashboard_model.dart';
import 'package:my_hris/core/dashboard/domain/entity/user_location_model.dart';
import 'package:my_hris/core/dashboard/domain/use-case/dashboard_interactor.dart';

Provider<DashboardInteractor> dashboardInteractor =
    Provider<DashboardInteractor>((ref) => DashboardInteractor());

AutoDisposeFutureProvider<DashboardModel> dashboardController =
    FutureProvider.autoDispose<DashboardModel>(
  (ref) => ref.watch(dashboardInteractor).getDashboardInfo(),
);

FutureProvider<UserLocationModel> dashboardLocationController =
    FutureProvider<UserLocationModel>(
  (ref) => ref.watch(dashboardInteractor).getCurrentLocation(),
);
