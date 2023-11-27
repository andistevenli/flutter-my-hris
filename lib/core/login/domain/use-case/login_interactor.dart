import 'package:my_hris/core/login/data/repository/login_repo.dart';
import 'package:my_hris/core/login/domain/di/login_domain_injector.dart';
import 'package:my_hris/core/login/domain/entity/login_model.dart';
import 'package:my_hris/core/login/domain/repository/login_repo_impl.dart';

class LoginInteractor implements ILoginRepo {
  @override
  Future<LoginModel> login() async {
    return await loginDomainInjector<LoginRepoImpl>().login();
  }
}
