import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_api_demo/bloc/table_resto_bloc.dart';
import 'package:latihan_api_demo/services/table_resto_service.dart';

class TableRestoPage extends StatefulWidget {
  const TableRestoPage({super.key});

  @override
  State<TableRestoPage> createState() => _TableRestoPageState();
}

class _TableRestoPageState extends State<TableRestoPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            TableRestoBloc(TableRestoService())..add(LoadTableResto()),
        child: Scaffold(
            appBar: AppBar(
              title: Text('Table Resto'),
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            body: BlocBuilder<TableRestoBloc, TableRestoState>(
              builder: (context, state) {
                debugPrint(state.toString());
                if (state is TableRestoInitial) {
                  return Center(
                    child: Text('Loading...'),
                  );
                } else if (state is TableRestoLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is TableRestoError) {
                  return Center(
                    child: Text(state.message),
                  );
                } else if (state is TableRestoLoaded) {
                  final data = state.tables;
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Text((index + 1).toString()),
                          title:
                              Text('${data[index].name} ${data[index].code}'),
                          subtitle: Text('${data[index].capacity} seats'),
                          trailing: ,
                      });
                }
                return Center(child: Text('Something went error'));
              },
            )));
  }
}
