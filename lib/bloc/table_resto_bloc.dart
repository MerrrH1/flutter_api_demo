import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:latihan_api_demo/models/table_resto_model.dart';
import 'package:latihan_api_demo/services/table_resto_service.dart';
import "package:meta/meta.dart";

part 'table_resto_event.dart';
part 'table_resto_state.dart';

class TableRestoBloc extends Bloc<TableRestoEvent, TableRestoState> {
  final TableRestoService service;
  TableRestoBloc(this.service) : super(TableRestoInitial()) {
    on<LoadTableResto>((event, emit) async {
      emit(TableRestoLoading());
      try {
        final result = await service.getTables();
        emit(TableRestoLoaded(tables: result.listTable));
      } catch (e) {
        emit(TableRestoError(message: e.toString()));
      }
    });
  }
}
