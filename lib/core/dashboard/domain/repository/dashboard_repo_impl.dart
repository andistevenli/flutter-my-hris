import 'package:my_hris/core/dashboard/data/data-source/local/dashboard_local_data_source.dart';
import 'package:my_hris/core/dashboard/data/data-source/remote/dashboard_remote_data_source.dart';
import 'package:my_hris/core/dashboard/data/dto/user_location_dto.dart';
import 'package:my_hris/core/dashboard/data/mapper/user_location_mapper.dart';
import 'package:my_hris/core/dashboard/data/repository/dashboard_repo.dart';
import 'package:my_hris/core/dashboard/domain/di/dashboard_domain_injector.dart';
import 'package:my_hris/core/dashboard/domain/entity/dashboard_model.dart';
import 'package:my_hris/core/dashboard/data/mapper/dashboard_mapper.dart';
import 'package:my_hris/core/dashboard/domain/entity/user_location_model.dart';

class DashboardRepoImpl implements IDashboardRepo {
  @override
  Future<DashboardModel> getDashboardInfo() async {
    return moveToDashboardModel(
        await dashboardDomainInjector<DashboardLocalDataSource>()
            .getDashboardInfo());
  }

  @override
  Future<UserLocationModel> getCurrentLocation() async {
    try {
      final UserLocationDTO location =
          await dashboardDomainInjector<DashboardRemoteDataSource>()
              .getCurrentLocation();
      final UserLocationModel locationModel = moveToLocationModel(location);
      return locationModel;
    } catch (e) {
      throw Exception(e);
    }
  }
}
