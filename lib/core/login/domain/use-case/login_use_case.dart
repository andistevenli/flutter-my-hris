import 'package:my_hris/core/login/domain/entity/login_model.dart';

abstract class LoginUseCase {
  Future<LoginModel> login(final String email, final String password);
}
