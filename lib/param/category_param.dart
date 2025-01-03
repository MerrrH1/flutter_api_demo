class CategoryParam {
  final String name;
  final String status;

  CategoryParam({required this.name, required this.status});

  factory CategoryParam.fromJson(Map<String, dynamic> json) {
    return CategoryParam(name: json['name'], status: json['status']);
  }
}
