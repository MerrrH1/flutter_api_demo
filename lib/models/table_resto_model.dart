class TableRestoModel {
  final int id;
  final String code;
  final String name;
  final int capacity;
  final String tableStatus;
  final String status;

  TableRestoModel(
      {required this.id,
      required this.code,
      required this.name,
      required this.capacity,
      required this.tableStatus,
      required this.status});

  factory TableRestoModel.fromJson(Map<String, dynamic> json) =>
      TableRestoModel(
          id: json['id'],
          code: json['code'],
          name: json['name'],
          capacity: json['capacity'],
          tableStatus: json['table_status'],
          status: json['status']);
}
