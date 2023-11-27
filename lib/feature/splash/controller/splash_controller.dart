import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_hris/core/splash/domain/entity/splash_model.dart';
import 'package:my_hris/core/splash/domain/use-case/splash_interactor.dart';

Provider<SplashInteractor> splashInteractor = Provider<SplashInteractor>(
  (ref) => SplashInteractor(),
);

AutoDisposeFutureProvider<SplashModel> splashController =
    FutureProvider.autoDispose<SplashModel>(
  (ref) => ref.watch(splashInteractor).generateEurekaEdutechLogo(),
);
