class MenuRestoParam {
  final String code;
  final String name;
  final double price;
  final String? description;
  final String image;
  final String menuStatus;
  final String status;
  final int category;

  MenuRestoParam(
      {required this.code,
      required this.name,
      required this.price,
      required this.description,
      required this.image,
      required this.menuStatus,
      required this.status,
      required this.category});

  factory MenuRestoParam.fromJson(Map<String, dynamic> json) => MenuRestoParam(
      code: json['code'],
      name: json['name'],
      price: double.parse(json['price']),
      description: json['description'] ?? "",
      image: json['image_menu'] ?? "",
      menuStatus: json['menu_status'],
      status: json['status'],
      category: json['category']);
}
