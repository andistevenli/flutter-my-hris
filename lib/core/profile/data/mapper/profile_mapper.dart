import 'package:my_hris/core/profile/data/dto/profile_dto.dart';
import 'package:my_hris/core/profile/data/mapper/address_mapper.dart';
import 'package:my_hris/core/profile/data/mapper/documents_mapper.dart';
import 'package:my_hris/core/profile/data/mapper/employment_mapper.dart';
import 'package:my_hris/core/profile/data/mapper/personal_mapper.dart';
import 'package:my_hris/core/profile/domain/entity/profile_model.dart';

ProfileModel moveToProfileModel(ProfileDTO from) {
  return ProfileModel(
    personalModel: moveToPersonalModel(from.personalDTO),
    employmentModel: moveToEmploymentModel(from.employmentDTO),
    addressModel: moveToAddressModel(from.addressDTO),
    documentsModel: moveToDocumentsModel(from.documentsDTO),
  );
}
