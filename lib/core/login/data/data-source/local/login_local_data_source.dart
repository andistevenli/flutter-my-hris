import 'package:my_hris/core/login/data/dto/login_dto.dart';
import 'package:my_hris/utils/constant/constant_input.dart';

class LoginLocalDataSource {
  Future<LoginDTO> login() async {
    return LoginDTO(
      email: eurekaEdutechEmail,
      password: eurekaEdutechPassword,
    );
  }
}
