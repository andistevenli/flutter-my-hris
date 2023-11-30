import 'package:my_hris/core/profile/domain/di/profile_domain_injector.dart';
import 'package:my_hris/core/profile/domain/entity/profile_model.dart';
import 'package:my_hris/core/profile/domain/repo/profile_repo_impl.dart';
import 'package:my_hris/core/profile/domain/use-case/profile_use_case.dart';

class ProfileInteractor implements ProfileUseCase {
  @override
  Future<ProfileModel> getProfileInfo() async {
    try {
      return await profileDomainInjector<ProfileRepoImpl>().getProfileInfo();
    } catch (e) {
      throw Exception(e);
    }
  }
}
