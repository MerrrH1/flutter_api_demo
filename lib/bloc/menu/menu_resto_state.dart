part of 'menu_resto_bloc.dart';

@immutable
sealed class MenuRestoState {}

final class MenuRestoInitial extends MenuRestoState {}

final class MenuRestoLoading extends MenuRestoState {}

final class MenuRestoLoaded extends MenuRestoState {
  final List<MenuRestoModel> menus;
  MenuRestoLoaded({required this.menus});
}

final class MenuRestoError extends MenuRestoState {
  final String message;
  MenuRestoError({required this.message});
}