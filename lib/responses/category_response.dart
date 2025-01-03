import 'package:latihan_api_demo/models/category_model.dart';

class CategoryResponse {
  List<CategoryModel> listCategory;
  CategoryResponse({required this.listCategory});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
        listCategory:
            List.from(json['data'].map((e) => CategoryModel.fromJson(e))));
  }
}
