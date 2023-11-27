import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_hris/core/login/domain/entity/login_model.dart';
import 'package:my_hris/core/login/domain/use-case/login_interactor.dart';

class LoginParameter {
  final String email;
  final String password;

  LoginParameter({
    required this.email,
    required this.password,
  });
}

Provider<LoginInteractor> loginInteractor = Provider<LoginInteractor>(
  (ref) => LoginInteractor(),
);

AutoDisposeFutureProviderFamily<LoginModel, LoginParameter> loginController =
    FutureProvider.autoDispose.family<LoginModel, LoginParameter>(
  (ref, arg) => ref.watch(loginInteractor).login(arg.email, arg.password),
);
