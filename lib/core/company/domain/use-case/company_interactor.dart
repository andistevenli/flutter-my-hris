import 'package:my_hris/core/company/domain/di/company_domain_injector.dart';
import 'package:my_hris/core/company/domain/entity/department_model.dart';
import 'package:my_hris/core/company/domain/entity/general_model.dart';
import 'package:my_hris/core/company/domain/entity/position_model.dart';
import 'package:my_hris/core/company/domain/repo/company_repo_impl.dart';
import 'package:my_hris/core/company/domain/use-case/company_use_case.dart';

class CompanyInteractor implements CompanyUseCase {
  @override
  Future<List<DepartmentModel>> getDepartmentInfo() async {
    try {
      return await companyDomainInjector<CompanyRepoImpl>().getDepartmentInfo();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<GeneralModel> getGeneralInfo() async {
    try {
      return await companyDomainInjector<CompanyRepoImpl>().getGeneralInfo();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<PositionModel>> getPositionInfo() async {
    try {
      return await companyDomainInjector<CompanyRepoImpl>().getPositionInfo();
    } catch (e) {
      throw Exception(e);
    }
  }
}
