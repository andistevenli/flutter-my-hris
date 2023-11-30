import 'package:my_hris/core/company/data/dto/tax_information_dto.dart';
import 'package:my_hris/core/company/domain/entity/tax_information_model.dart';

TaxInformationModel moveToTaxInformationModel(TaxInformationDTO from) {
  return TaxInformationModel(
    companyNPWP: from.companyNPWP,
    taxableDate: from.taxableDate,
    taxPersonName: from.taxPersonName,
    taxPersonNPWP: from.taxPersonNPWP,
  );
}
