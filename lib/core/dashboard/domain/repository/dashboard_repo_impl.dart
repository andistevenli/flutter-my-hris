import 'package:my_hris/core/dashboard/data/data-source/local/dashboard_local_data_source.dart';
import 'package:my_hris/core/dashboard/data/repository/dashboard_repo.dart';
import 'package:my_hris/core/dashboard/domain/di/dashboard_domain_injector.dart';
import 'package:my_hris/core/dashboard/domain/entity/dashboard_model.dart';
import 'package:my_hris/core/dashboard/data/mapper/dashboard_mapper.dart';

class DashboardRepoImpl implements IDashboardRepo {
  @override
  Future<DashboardModel> getDashboardInfo() async {
    return moveToDashboardModel(
        await dashboardDomainInjector<DashboardLocalDataSource>()
            .getDashboardInfo());
  }
}
