import 'package:my_hris/core/profile/domain/entity/address_model.dart';
import 'package:my_hris/core/profile/domain/entity/documents_model.dart';
import 'package:my_hris/core/profile/domain/entity/employment_model.dart';
import 'package:my_hris/core/profile/domain/entity/personal_model.dart';

class ProfileModel {
  final PersonalModel personalModel;
  final EmploymentModel employmentModel;
  final AddressModel addressModel;
  final DocumentsModel documentsModel;

  ProfileModel({
    required this.personalModel,
    required this.employmentModel,
    required this.addressModel,
    required this.documentsModel,
  });
}
