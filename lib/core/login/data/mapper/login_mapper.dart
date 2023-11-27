import 'package:my_hris/core/login/data/dto/login_dto.dart';
import 'package:my_hris/core/login/domain/entity/login_model.dart';

LoginModel moveToLoginModel(LoginDTO from) {
  return LoginModel(
    email: from.email,
    password: from.password,
  );
}
