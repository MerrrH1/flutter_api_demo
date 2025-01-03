import 'package:dio/dio.dart';
import 'package:latihan_api_demo/responses/menu_resto_response.dart';

class MenuRestoService {
  final dio = Dio(BaseOptions(baseUrl: 'http://192.168.18.22:8000/api'));

  Future<MenuRestoResponse> getMenu() async {
    try {
      final response = await dio.get('/menu_resto');
      // debugPrint('Response : ${response.data}');
      return MenuRestoResponse.fromJson(response.data);
    } on DioException catch(e) {
      throw('Failed to fetch menu : ${e.toString()}');
    }
  }
}