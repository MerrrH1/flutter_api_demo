import 'package:latihan_api_demo/models/menu_resto_model.dart';

class MenuRestoResponse {
  List<MenuRestoModel> listMenu;
  MenuRestoResponse({required this.listMenu});

  factory MenuRestoResponse.fromJson(Map<String, dynamic> json) {
    return MenuRestoResponse(
        listMenu:
            List.from(json['data'].map((e) => MenuRestoModel.fromJson(e))));
  }
}
