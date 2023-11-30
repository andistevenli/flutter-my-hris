import 'package:my_hris/core/company/data/dto/general_dto.dart';
import 'package:my_hris/core/company/data/mapper/company_information_mapper.dart';
import 'package:my_hris/core/company/data/mapper/location_mapper.dart';
import 'package:my_hris/core/company/data/mapper/tax_information_mapper.dart';
import 'package:my_hris/core/company/domain/entity/general_model.dart';

GeneralModel moveToGeneralModel(GeneralDTO from) {
  return GeneralModel(
    companyInformationModel:
        moveToCompanyInformationModel(from.companyInformationDTO),
    taxInformationModel: moveToTaxInformationModel(from.taxInformationDTO),
    locationModel: moveToLocationModel(from.locationDTO),
  );
}
