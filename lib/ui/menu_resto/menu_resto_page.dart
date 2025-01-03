import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import 'package:latihan_api_demo/services/menu_resto_service.dart';

import '../../bloc/menu/menu_resto_bloc.dart';

class MenuRestoPage extends StatefulWidget {
  const MenuRestoPage({super.key});

  @override
  State<MenuRestoPage> createState() => _MenuRestoPageState();
}

class _MenuRestoPageState extends State<MenuRestoPage> {
  final service = MenuRestoService();
  Map<int, int> orderQty = {};

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MenuRestoBloc(MenuRestoService())..add(LoadMenuResto()),
      child: Scaffold(
        appBar: AppBar(
            title: Text('Menu'),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary),
        body: BlocBuilder<MenuRestoBloc, MenuRestoState>(
          builder: (context, state) {
            if (state is MenuRestoInitial) {
              return Center(child: Text('Loading'));
            } else if (state is MenuRestoLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is MenuRestoError) {
              return Center(child: Text(state.message));
            } else if (state is MenuRestoLoaded) {
              final menu = state.menus;
              return ListView.builder(
                  itemCount: menu.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        child: Card(
                      margin: EdgeInsets.all(8.0),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                                width: 60, height: 60, fit: BoxFit.cover),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    menu[index].name,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    NumberFormat.currency(
                                            locale: 'id_ID',
                                            symbol: 'Rp ',
                                            decimalDigits: 0)
                                        .format(menu[index].price),
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.grey[700]),
                                  ),
                                ],
                              ),
                            ),
                            ItemCount(
                                initialValue: 0,
                                minValue: 0,
                                maxValue: 999,
                                onChanged: (value) {
                                  // Handle counter value changes
                                  print('Selected value: $value');
                                },
                                decimalPlaces: 0)
                          ],
                        ),
                      ),
                    ));
                  });
            }
            return Text('Something went error');
          },
        ),
      ),
    );
  }
}
