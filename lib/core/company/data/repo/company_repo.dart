import 'package:my_hris/core/company/domain/entity/department_model.dart';
import 'package:my_hris/core/company/domain/entity/general_model.dart';
import 'package:my_hris/core/company/domain/entity/position_model.dart';

abstract class ICompanyRepo {
  Future<GeneralModel> getGeneralInfo();
  Future<List<DepartmentModel>> getDepartmentInfo();
  Future<List<PositionModel>> getPositionInfo();
}
