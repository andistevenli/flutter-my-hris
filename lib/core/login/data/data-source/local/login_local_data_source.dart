import 'package:my_hris/core/login/data/dto/login_dto.dart';

class LoginLocalDataSource {
  Future<LoginDTO> login(final String email, final String password) async {
    return LoginDTO(email: email, password: password);
  }
}
