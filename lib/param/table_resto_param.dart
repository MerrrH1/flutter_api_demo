class TableRestoParam {
  final String code;
  final String name;
  final int capacity;
  final String tableStatus;
  final String status;

  TableRestoParam(
      {required this.code,
      required this.name,
      required this.capacity,
      required this.tableStatus,
      required this.status});

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'capacity': capacity,
      'table_status': tableStatus,
      'status': status
    };
  }
}
