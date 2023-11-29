import 'package:my_hris/core/profile/data/dto/documents_dto.dart';
import 'package:my_hris/core/profile/domain/entity/documents_model.dart';

DocumentsModel moveToDocumentsModel(DocumentsDTO from) {
  return DocumentsModel(
    ktp: from.ktp,
    kk: from.kk,
    bpjs: from.bpjs,
  );
}
