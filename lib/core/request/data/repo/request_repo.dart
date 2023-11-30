import 'package:my_hris/core/request/domain/entity/request_model.dart';

abstract class IRequestRepo {
  Future<List<RequestModel>> getRequestInfo();
}
