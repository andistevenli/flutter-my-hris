import 'package:my_hris/core/profile/data/data-source/local/profile_local_data_source.dart';
import 'package:my_hris/core/profile/data/repo/profile_repo.dart';
import 'package:my_hris/core/profile/domain/di/profile_domain_injector.dart';
import 'package:my_hris/core/profile/domain/entity/profile_model.dart';
import 'package:my_hris/core/profile/data/mapper/profile_mapper.dart';

class ProfileRepoImpl implements IProfileRepo {
  @override
  Future<ProfileModel> getProfileInfo() async {
    try {
      return moveToProfileModel(
          await profileDomainInjector<ProfileLocalDataSource>()
              .getProfileInfo());
    } catch (e) {
      throw Exception(e);
    }
  }
}
