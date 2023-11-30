import 'package:my_hris/core/dashboard/domain/di/dashboard_domain_injector.dart';
import 'package:my_hris/core/dashboard/domain/entity/dashboard_model.dart';
import 'package:my_hris/core/dashboard/domain/entity/user_location_model.dart';
import 'package:my_hris/core/dashboard/domain/repository/dashboard_repo_impl.dart';
import 'package:my_hris/core/dashboard/domain/use-case/dashboard_use_case.dart';

class DashboardInteractor implements DashboardUseCase {
  @override
  Future<DashboardModel> getDashboardInfo() async {
    try {
      return await dashboardDomainInjector<DashboardRepoImpl>()
          .getDashboardInfo();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<UserLocationModel> getCurrentLocation() async {
    try {
      return await dashboardDomainInjector<DashboardRepoImpl>()
          .getCurrentLocation();
    } catch (e) {
      throw Exception(e);
    }
  }
}
