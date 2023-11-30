import 'package:my_hris/core/profile/domain/entity/profile_model.dart';

abstract class ProfileUseCase {
  Future<ProfileModel> getProfileInfo();
}
