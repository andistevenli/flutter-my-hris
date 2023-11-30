import 'package:my_hris/core/employees/domain/di/employees_domain_injector.dart';
import 'package:my_hris/core/employees/domain/entity/employees_model.dart';
import 'package:my_hris/core/employees/domain/repo/employees_repo_impl.dart';
import 'package:my_hris/core/employees/domain/use-case/employees_use_case.dart';

class EmployeesInteractor implements EmployeesUseCase {
  @override
  Future<List<EmployeesModel>> getEmployeesInfo() async {
    return await employeesDomainInjector<EmployeesRepoImpl>()
        .getEmployeesInfo();
  }

  @override
  Future<EmployeesModel> getEmployeesDetailInfo(int index) async {
    try {
      return await employeesDomainInjector<EmployeesRepoImpl>()
          .getEmployeesDetailInfo(index);
    } catch (e) {
      throw Exception(e);
    }
  }
}
