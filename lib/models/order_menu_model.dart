class OrderMenuModel {
  final int id;
  final String code;
  final String orderStatus;
  final double totalOrder;
  final double taxOrder;
  final double totalPayment;
  final double payment;
  final double changed;
  final String status;
  final int tableResto;
  final int cashier;
  final int waitress;

  OrderMenuModel(
      {required this.id,
        required this.code,
        required this.orderStatus,
        required this.totalOrder,
        required this.taxOrder,
        required this.totalPayment,
        required this.payment,
        required this.changed,
        required this.status,
        required this.tableResto,
        required this.cashier,
        required this.waitress});

  factory OrderMenuModel.fromJson(Map<String, dynamic> json) {
    return OrderMenuModel(
        id: json['id'],
        code: json['code'],
        orderStatus: json['order_status'],
        totalOrder: json['total_order'],
        taxOrder: json['tax_order'],
        totalPayment: json['total_payment'],
        payment: json['payment'],
        changed: json['changed'],
        status: json['status'],
        tableResto: json['table_resto'],
        cashier: json['cashier'],
        waitress: json['waitress']);
  }
}
