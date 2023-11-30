import 'package:my_hris/core/company/data/data-source/local/company_local_data_source.dart';
import 'package:my_hris/core/company/data/dto/department_dto.dart';
import 'package:my_hris/core/company/data/dto/position_dto.dart';
import 'package:my_hris/core/company/data/mapper/department_mapper.dart';
import 'package:my_hris/core/company/data/mapper/general_mapper.dart';
import 'package:my_hris/core/company/data/mapper/position_mapper.dart';
import 'package:my_hris/core/company/data/repo/company_repo.dart';
import 'package:my_hris/core/company/domain/di/company_domain_injector.dart';
import 'package:my_hris/core/company/domain/entity/department_model.dart';
import 'package:my_hris/core/company/domain/entity/general_model.dart';
import 'package:my_hris/core/company/domain/entity/position_model.dart';

class CompanyRepoImpl implements ICompanyRepo {
  @override
  Future<List<DepartmentModel>> getDepartmentInfo() async {
    try {
      List<DepartmentDTO> listDto =
          await companyDomainInjector<CompanyLocalDataSource>()
              .getDepartmentInfo();
      return listDto.map((e) => moveToDepartmentModel(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<GeneralModel> getGeneralInfo() async {
    try {
      return moveToGeneralModel(
          await companyDomainInjector<CompanyLocalDataSource>()
              .getGeneralInfo());
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<PositionModel>> getPositionInfo() async {
    try {
      List<PositionDTO> listDto =
          await companyDomainInjector<CompanyLocalDataSource>()
              .getPositionInfo();
      return listDto.map((e) => moveToPositionModel(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
