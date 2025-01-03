class OrderMenuDetailModel {
  final int id;
  final int quantity;
  final double subtotal;
  final String? description;
  final String orderMenuDetailStatus;
  final String status;
  final int orderMenu;
  final int menuResto;

  OrderMenuDetailModel(
      {required this.id,
      required this.quantity,
      required this.subtotal,
      required this.description,
      required this.orderMenuDetailStatus,
      required this.status,
      required this.orderMenu,
      required this.menuResto});

  factory OrderMenuDetailModel.fromJson(Map<String, dynamic> json) {
    return OrderMenuDetailModel(
        id: json['id'],
        quantity: json['quantity'],
        subtotal: json['subtotal'],
        description: json['description'],
        orderMenuDetailStatus: json['order_menu_detail_status'],
        status: json['status'],
        orderMenu: json['order_menu'],
        menuResto: json['menu_resto']);
  }
}
