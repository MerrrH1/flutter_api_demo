import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:latihan_api_demo/param/table_resto_param.dart';
import 'package:latihan_api_demo/responses/table_resto_response.dart';

class TableRestoService {
  final dio = Dio(BaseOptions(baseUrl: 'http://192.168.18.22:8000/api'));

  Future<TableRestoResponse> getTables() async {
    try {
      final response = await dio.get('/table_resto');
      debugPrint('Response : ${response.data['data']}');
      return TableRestoResponse.fromJson(response.data);
    } on DioException catch(e) {
      throw('Failed to fetch table : ${e.toString()}');
    }
  }

  Future<TableRestoResponse> addTable(TableRestoParam tableParam) async {
    try {
      final response = await dio.post('/table_resto', data: tableParam.toJson());
      return TableRestoResponse.fromJson(response.data);
    } on DioException catch(e) {
      throw('Failed to add table : ${e.toString()}');
    }
  }

  Future<TableRestoResponse> getTableById(int id) async {
    try {
      final response = await dio.get('/table_resto/$id');
      debugPrint('Response : ${response.data['data']['id']}');
      return TableRestoResponse.fromJson(response.data);
    } on DioException catch(e) {
      throw('Failed to get table : ${e.toString()}');
    }
  }
  
  Future<TableRestoResponse> updateTable(int id, TableRestoParam tableParam) async {
    try {
      final response = await dio.put('/table_resto/$id', data: tableParam.toJson());
      return TableRestoResponse.fromJson(response.data);
    } on DioException catch(e) {
      throw('Failed to update table : ${e.toString()}');
    }
  }
}
