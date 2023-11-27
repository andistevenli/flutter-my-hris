import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_hris/core/login/domain/entity/login_model.dart';
import 'package:my_hris/core/login/domain/use-case/login_interactor.dart';

Provider<LoginInteractor> loginInteractor = Provider<LoginInteractor>(
  (ref) => LoginInteractor(),
);

AutoDisposeFutureProvider<LoginModel> loginController =
    FutureProvider.autoDispose<LoginModel>(
  (ref) => ref.watch(loginInteractor).login(),
);
