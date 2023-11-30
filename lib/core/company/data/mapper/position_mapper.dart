import 'package:my_hris/core/company/data/dto/position_dto.dart';
import 'package:my_hris/core/company/domain/entity/position_model.dart';

PositionModel moveToPositionModel(PositionDTO from) {
  return PositionModel(
    positionName: from.positionName,
    departmentName: from.departmentName,
    employees: from.employees,
  );
}
