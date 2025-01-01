class TableRestoParam {
  final String code;
  final String name;
  final int capacity;

  TableRestoParam({required this.code, required this.name, required this.capacity});

  Map<String, dynamic> toJson() {
    return {
      'code' : code,
      'name' : name,
      'capacity' : capacity
    };
  }
}