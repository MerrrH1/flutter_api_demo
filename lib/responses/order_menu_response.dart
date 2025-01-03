import 'package:latihan_api_demo/models/order_menu_model.dart';

class OrderMenuResponse {
  List<OrderMenuModel> listOrder;
  OrderMenuResponse({required this.listOrder});

  factory OrderMenuResponse.fromJson(Map<String, dynamic> json) {
    return OrderMenuResponse(
        listOrder:
            List.from(json['data'].map((e) => OrderMenuModel.fromJson(e))));
  }
}
