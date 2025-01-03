import 'package:latihan_api_demo/models/table_resto_model.dart';

class TableRestoResponse {
  List<TableRestoModel> listTable;
  TableRestoResponse({required this.listTable});

  factory TableRestoResponse.fromJson(Map<String, dynamic> json) {
    return TableRestoResponse(
        listTable:
            List.from(json['data'].map((e) => TableRestoModel.fromJson(e))));
  }
}
