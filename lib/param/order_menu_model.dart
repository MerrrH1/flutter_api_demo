class OrderMenuParam {
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

  OrderMenuParam(
      {required this.code,
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

  factory OrderMenuParam.fromJson(Map<String, dynamic> json) {
    return OrderMenuParam(
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
