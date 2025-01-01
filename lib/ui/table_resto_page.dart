import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_api_demo/bloc/table/table_resto_bloc.dart';
import 'package:latihan_api_demo/services/table_resto_service.dart';
import 'package:latihan_api_demo/ui/table_resto_form.dart';

import '../models/table_resto_model.dart';

class TableRestoPage extends StatefulWidget {
  const TableRestoPage({super.key});

  @override
  State<TableRestoPage> createState() => _TableRestoPageState();
}

class _TableRestoPageState extends State<TableRestoPage> {
  TableRestoModel? tableRestoModel;
  Future<void> _refreshData(BuildContext context) async {
    context.read<TableRestoBloc>().add(LoadTableResto());
  }

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
                return RefreshIndicator(
                  onRefresh: () => _refreshData(context),
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text((index + 1).toString()),
                        title: Text('${data[index].name} ${data[index].code}'),
                        subtitle: Text('${data[index].capacity} seats'),
                        trailing: ElevatedButton(
                          onPressed: () {
                            if (data[index].tableStatus == "Kosong") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Berhasil memesan meja'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                            if (data[index].tableStatus == "Terisi") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Berhasil membatalkan meja'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          child: Text(
                            data[index].tableStatus == "Kosong"
                                ? "Pesan"
                                : "Batal",
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              return Center(child: Text('Something went error'));
            },
          ),
          floatingActionButton: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TableRestoForm(tableRestoModel: tableRestoModel))).then((_) {
                      setState(() {
                        _refreshData(context);
                      });
                });
              },
              child: Icon(Icons.add))),
    );
  }
}
