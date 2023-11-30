import 'package:my_hris/core/company/domain/entity/department_model.dart';
import 'package:my_hris/core/company/domain/entity/general_model.dart';
import 'package:my_hris/core/company/domain/entity/position_model.dart';

abstract class CompanyUseCase {
  Future<List<DepartmentModel>> getDepartmentInfo();
  Future<GeneralModel> getGeneralInfo();
  Future<List<PositionModel>> getPositionInfo();
}
