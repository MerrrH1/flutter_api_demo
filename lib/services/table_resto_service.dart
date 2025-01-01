import 'package:dio/dio.dart';
import 'package:latihan_api_demo/models/table_resto_model.dart';
import 'package:latihan_api_demo/param/table_resto_param.dart';
import 'package:latihan_api_demo/responses/table_resto_response.dart';

class TableRestoService {
  final dio = Dio(BaseOptions(baseUrl: 'http://192.168.10.4:8000/api'));

  Future<TableRestoResponse> getTables() async {
    try {
      final response = await dio.get('/table_resto');
      return TableRestoResponse.fromJson(response.data);
    } on DioException catch(e) {
      throw('Failed to fetch table : ${e.toString()}');
    }
  }

  Future<TableRestoResponse> addTable(TableRestoParam tableParam) async {
    try {
      final response = await dio.post('/table_resto', data: tableParam.toJson());
      return TableRestoResponse.fromJson(response.data);
    } on DioException catch(e) {
      throw('Failed to add table : ${e.toString()}');
    }
  }
}
