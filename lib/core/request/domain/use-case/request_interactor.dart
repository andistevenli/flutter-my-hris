import 'package:my_hris/core/request/domain/di/request_domain_injector.dart';
import 'package:my_hris/core/request/domain/entity/request_model.dart';
import 'package:my_hris/core/request/domain/repo/request_repo_impl.dart';
import 'package:my_hris/core/request/domain/use-case/request_use_case.dart';

class RequestInteractor implements RequestUseCase {
  @override
  Future<List<RequestModel>> getRequestInfo() async {
    try {
      return await requestDomainInjector<RequestRepoImpl>().getRequestInfo();
    } catch (e) {
      throw Exception(e);
    }
  }
}
