class OrderMenuDetailParam {
  final int quantity;
  final double subtotal;
  final String? description;
  final String orderMenuDetailStatus;
  final String status;
  final int orderMenu;
  final int menuResto;

  OrderMenuDetailParam(
      {required this.quantity,
      required this.subtotal,
      required this.description,
      required this.orderMenuDetailStatus,
      required this.status,
      required this.orderMenu,
      required this.menuResto});

  factory OrderMenuDetailParam.fromJson(Map<String, dynamic> json) {
    return OrderMenuDetailParam(
        quantity: json['quantity'],
        subtotal: json['subtotal'],
        description: json['description'],
        orderMenuDetailStatus: json['order_menu_detail_status'],
        status: json['status'],
        orderMenu: json['order_menu'],
        menuResto: json['menu_resto']);
  }
}
