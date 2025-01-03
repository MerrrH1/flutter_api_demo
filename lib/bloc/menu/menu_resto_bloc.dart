import 'package:bloc/bloc.dart';
import 'package:latihan_api_demo/models/menu_resto_model.dart';
import 'package:latihan_api_demo/services/menu_resto_service.dart';
import 'package:meta/meta.dart';

part 'menu_resto_event.dart';
part 'menu_resto_state.dart';

class MenuRestoBloc extends Bloc<MenuRestoEvent, MenuRestoState> {
  final MenuRestoService menuRestoService;
  MenuRestoBloc(this.menuRestoService) : super(MenuRestoInitial()) {
    on<LoadMenuResto>((event, emit) async {
      emit(MenuRestoLoading());
      try {
        final result = await menuRestoService.getMenu();
        emit(MenuRestoLoaded(menus: result.listMenu));
      } catch (e) {
        emit(MenuRestoError(message: e.toString()));
      }
    });
  }
}
