import 'package:my_hris/core/login/domain/entity/login_model.dart';

abstract class ILoginRepo {
  Future<LoginModel> login();
}
