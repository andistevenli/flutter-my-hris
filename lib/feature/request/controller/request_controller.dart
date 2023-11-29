import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_hris/core/request/domain/entity/request_model.dart';
import 'package:my_hris/core/request/domain/use-case/request_interactor.dart';

Provider<RequestInteractor> requestInteractor =
    Provider<RequestInteractor>((ref) => RequestInteractor());

AutoDisposeFutureProvider<List<RequestModel>> requestController = FutureProvider.autoDispose<List<RequestModel>>(
  (ref) => ref.watch(requestInteractor).getRequestInfo(),
);

