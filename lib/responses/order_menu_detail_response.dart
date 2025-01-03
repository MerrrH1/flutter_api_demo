import 'package:latihan_api_demo/models/order_menu_detail_model.dart';

class OrderMenuDetailResponse {
  List<OrderMenuDetailModel> listOrderDetail;
  OrderMenuDetailResponse({required this.listOrderDetail});

  factory OrderMenuDetailResponse.fromJson(Map<String, dynamic> json) {
    return OrderMenuDetailResponse(
        listOrderDetail: List.from(
            json['data'].map((e) => OrderMenuDetailModel.fromJson(e))));
  }
}
