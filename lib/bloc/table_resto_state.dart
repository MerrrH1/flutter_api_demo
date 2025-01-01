part of 'table_resto_bloc.dart';

@immutable
sealed class TableRestoState {}

final class TableRestoInitial extends TableRestoState {}

final class TableRestoLoading extends TableRestoState {}

final class TableRestoLoaded extends TableRestoState {
  final List<TableRestoModel> tables;
  TableRestoLoaded({required this.tables});
}

final class TableRestoError extends TableRestoState {
  final String message;
  TableRestoError({required this.message});
}