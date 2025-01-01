
import 'package:dio/dio.dart';
import 'package:latihan_api_demo/responses/table_resto_response.dart';

class TableRestoService {
  final dio = Dio(BaseOptions(baseUrl: 'http://192.168.10.4:8000/api'));

  Future<TableRestoResponse> getTables() async {
    final response = await dio.get('/table_resto');
    return TableRestoResponse.fromJson(response.data);
  }
}
