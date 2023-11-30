import 'package:my_hris/core/company/data/dto/company_information_dto.dart';
import 'package:my_hris/core/company/data/dto/location_dto.dart';
import 'package:my_hris/core/company/data/dto/tax_information_dto.dart';

class GeneralDTO {
  final CompanyInformationDTO companyInformationDTO;
  final TaxInformationDTO taxInformationDTO;
  final LocationDTO locationDTO;

  GeneralDTO({
    required this.companyInformationDTO,
    required this.taxInformationDTO,
    required this.locationDTO,
  });
}
