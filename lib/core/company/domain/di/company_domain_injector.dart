import 'package:get_it/get_it.dart';
import 'package:my_hris/core/company/data/data-source/local/company_local_data_source.dart';
import 'package:my_hris/core/company/domain/repo/company_repo_impl.dart';

final GetIt companyDomainInjector = GetIt.instance;

void companyDomainInjectorSetup() {
  companyDomainInjector.registerLazySingleton(() => CompanyLocalDataSource());
  companyDomainInjector.registerLazySingleton(() => CompanyRepoImpl());
}
