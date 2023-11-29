import 'package:my_hris/core/request/data/dto/request_dto.dart';
import 'package:my_hris/core/request/domain/entity/request_model.dart';

RequestModel moveToRequestModel(RequestDTO from) {
  return RequestModel(
    type: from.type,
    status: from.status,
    date: from.date,
    reason: from.reason,
  );
}
