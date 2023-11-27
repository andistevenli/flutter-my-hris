import 'package:my_hris/core/login/data/data-source/local/login_local_data_source.dart';
import 'package:my_hris/core/login/data/mapper/login_mapper.dart';
import 'package:my_hris/core/login/data/repository/login_repo.dart';
import 'package:my_hris/core/login/domain/di/login_domain_injector.dart';
import 'package:my_hris/core/login/domain/entity/login_model.dart';

class LoginRepoImpl implements ILoginRepo {
  @override
  Future<LoginModel> login(String email, String password) async {
    return moveToLoginModel(
      await loginDomainInjector<LoginLocalDataSource>().login(email, password),
    );
  }
}
