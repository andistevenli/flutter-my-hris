import 'package:my_hris/core/company/data/dto/company_information_dto.dart';
import 'package:my_hris/core/company/domain/entity/company_information_model.dart';

CompanyInformationModel moveToCompanyInformationModel(
    CompanyInformationDTO from) {
  return CompanyInformationModel(
    companyName: from.companyName,
    phoneNumber: from.phoneNumber,
    email: from.email,
    address: from.address,
    province: from.province,
    city: from.city,
  );
}
