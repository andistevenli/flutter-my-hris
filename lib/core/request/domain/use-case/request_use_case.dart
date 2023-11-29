import 'package:my_hris/core/request/domain/entity/request_model.dart';

abstract class RequestUseCase {
  Future<List<RequestModel>> getRequestInfo();
}
