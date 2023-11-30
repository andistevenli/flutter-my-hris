import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_hris/core/profile/domain/entity/profile_model.dart';
import 'package:my_hris/core/profile/domain/use-case/profile_interactor.dart';

Provider<ProfileInteractor> profileInteractor =
    Provider<ProfileInteractor>((ref) => ProfileInteractor());

AutoDisposeFutureProvider<ProfileModel> profileController =
    FutureProvider.autoDispose<ProfileModel>(
  (ref) => ref.watch(profileInteractor).getProfileInfo(),
);
