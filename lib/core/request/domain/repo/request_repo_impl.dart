import 'package:my_hris/core/request/data/data-source/local/request_local_data_source.dart';
import 'package:my_hris/core/request/data/dto/request_dto.dart';
import 'package:my_hris/core/request/data/repo/request_repo.dart';
import 'package:my_hris/core/request/domain/di/request_domain_injector.dart';
import 'package:my_hris/core/request/domain/entity/request_model.dart';
import 'package:my_hris/core/request/data/mapper/request_mapper.dart';

class RequestRepoImpl implements IRequestRepo {
  @override
  Future<List<RequestModel>> getRequestInfo() async {
    try {
      List<RequestDTO> listDto =
          await requestDomainInjector<RequestLocalDataSource>()
              .getRequestInfo();
      List<RequestModel> listModel =
          listDto.map((e) => moveToRequestModel(e)).toList();
      return listModel;
    } catch (e) {
      throw Exception(e);
    }
  }
}
