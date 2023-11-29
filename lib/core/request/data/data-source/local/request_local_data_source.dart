import 'package:my_hris/core/request/data/dto/request_dto.dart';

class RequestLocalDataSource {
  Future<List<RequestDTO>> getRequestInfo() async {
    List<RequestDTO> list = <RequestDTO>[
      RequestDTO(
        type: "Annual Leave",
        status: "Rejected",
        date: "21 November 2023 (1 day)",
        reason: "-",
      ),
      RequestDTO(
        type: "Annual Leave",
        status: "Rejected",
        date: "21 November 2023 - 22 November 2023 (2 days)",
        reason: "-",
      ),
      RequestDTO(
        type: "Annual Leave",
        status: "Approved",
        date: "13 November 2023 - 14 November 2023 (2 days)",
        reason: "Izin cuti bertemu istri",
      ),
      RequestDTO(
        type: "Sick Leave",
        status: "Cancelled",
        date: "07 November 2023 (1 day)",
        reason: "-",
      ),
      RequestDTO(
        type: "WFH",
        status: "Approved",
        date: "03 July 2023 - 04 July 2023 (2 days)",
        reason: "Izin cuti tahunan",
      ),
    ];
    return list;
  }
}
