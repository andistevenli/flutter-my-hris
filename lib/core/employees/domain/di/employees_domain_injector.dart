import 'package:get_it/get_it.dart';
import 'package:my_hris/core/employees/data/data-source/local/employees_local_data_source.dart';
import 'package:my_hris/core/employees/domain/repo/employees_repo_impl.dart';

final GetIt employeesDomainInjector = GetIt.instance;

void employeesDomainInjectorSetup() {
  employeesDomainInjector
      .registerLazySingleton(() => EmployeesLocalDataSource());
  employeesDomainInjector.registerLazySingleton(() => EmployeesRepoImpl());
}
