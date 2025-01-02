import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_api_demo/bloc/table/table_resto_bloc.dart';
import 'package:latihan_api_demo/responses/table_resto_response.dart';
import 'package:latihan_api_demo/services/table_resto_service.dart';
import 'package:latihan_api_demo/ui/table_resto/table_resto_form.dart';

import '../../models/table_resto_model.dart';

class TableRestoPage extends StatefulWidget {
  const TableRestoPage({super.key});

  @override
  State<TableRestoPage> createState() => _TableRestoPageState();
}

class _TableRestoPageState extends State<TableRestoPage> {
  TableRestoModel? tableRestoModel;
  late Future<TableRestoResponse> futureGetTable;
  Future<void> _refreshData(BuildContext context) async {
    context.read<TableRestoBloc>().add(LoadTableResto());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TableRestoBloc(TableRestoService())..add(LoadTableResto()),
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Text('Meja'),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TableRestoForm(
                                tableRestoModel: tableRestoModel))).then((_) {
                      setState(() {
                        _refreshData(context);
                      });
                    });
                  },
                  icon: Icon(Icons.add))
            ],
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
                          tileColor: data[index].tableStatus == "Kosong"
                              ? Colors.green.shade50
                              : Colors.red.shade50,
                          leading: Text((index + 1).toString()),
                          title:
                              Text('${data[index].name} ${data[index].code}'),
                          subtitle: Text('${data[index].capacity} seats'),
                          trailing: PopupMenuButton<String>(
                            itemBuilder: (context) => [
                              PopupMenuItem<String>(
                                value: data[index].tableStatus == "Kosong"
                                    ? "order"
                                    : "cancel",
                                child: Text(data[index].tableStatus == "Kosong"
                                    ? "Pesan Meja"
                                    : "Batal"),
                              ),
                              PopupMenuItem<String>(
                                value: 'edit',
                                child: Text('Edit'),
                              ),
                              PopupMenuItem<String>(
                                value: 'delete',
                                child: Text('Delete'),
                              ),
                            ],
                            onSelected: (value) => {
                              if (value == "edit")
                                {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TableRestoForm(
                                              tableRestoModel: data[index])))
                                }
                              else if (value == "delete")
                                {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Menghapus meja')))
                                }
                              else if (value == "order")
                                {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Memesan meja")))
                                }
                              else if (value == "cancel")
                                {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text("Membatalkan meja")))
                                }
                            },
                          ));
                    },
                  ),
                );
              }
              return Center(child: Text('Something went error'));
            },
          )),
    );
  }
}
