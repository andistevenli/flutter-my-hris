import 'package:my_hris/core/company/domain/entity/company_information_model.dart';
import 'package:my_hris/core/company/domain/entity/location_model.dart';
import 'package:my_hris/core/company/domain/entity/tax_information_model.dart';

class GeneralModel {
  final CompanyInformationModel companyInformationModel;
  final TaxInformationModel taxInformationModel;
  final LocationModel locationModel;

  GeneralModel({
    required this.companyInformationModel,
    required this.taxInformationModel,
    required this.locationModel,
  });
}
