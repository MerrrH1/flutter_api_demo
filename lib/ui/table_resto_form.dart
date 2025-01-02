import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_api_demo/models/table_resto_model.dart';
import 'package:latihan_api_demo/param/table_resto_param.dart';
import 'package:latihan_api_demo/responses/table_resto_response.dart';
import 'package:latihan_api_demo/services/table_resto_service.dart';

class TableRestoForm extends StatefulWidget {
  TableRestoModel? tableRestoModel;
  TableRestoForm({super.key, required this.tableRestoModel});

  @override
  State<TableRestoForm> createState() => _TableRestoFormState();
}

class _TableRestoFormState extends State<TableRestoForm> {
  final tableServices = TableRestoService();
  late Future<TableRestoResponse> futureTableCreate;
  final globalKey = GlobalKey<FormState>();
  final tecName = TextEditingController();
  final tecCode = TextEditingController();
  final tecCapacity = TextEditingController();

  @override
  void initState() {
    // futureTableCreate = tableServices.addTable(TableRestoParam(code: '14', name: 'Meja baru', capacity: 15));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tableRestoModel == null
            ? "Form Add Table Resto"
            : "Form Update Table"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Form(
        key: globalKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: tecName,
                decoration: InputDecoration(
                    label: Text(
                      'Nama meja : ',
                    ),
                    hintText: "Masukkan nama meja"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Masukkan nama meja" : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: tecCode,
                decoration: InputDecoration(
                    label: Text(
                      'Kode meja : ',
                    ),
                    hintText: "Masukkan kode meja"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Masukkan kode meja" : null,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: tecCapacity,
                decoration: InputDecoration(
                    label: Text(
                      'Kapasitas meja : ',
                    ),
                    hintText: "Masukkan kapasitas meja"),
                validator: (value) => value == null || value.isEmpty
                    ? "Masukkan kapasitas meja"
                    : null,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              OverflowBar(
                alignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () {
                    if(globalKey.currentState!.validate()) {
                      futureTableCreate = tableServices.addTable(TableRestoParam(code: tecCode.text, name: tecName.text, capacity: int.parse(tecCapacity.text)));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data berhasil disimpan')));
                      Navigator.pop(context);
                    }
                  }, child: Text('Simpan')),
                  OutlinedButton(onPressed: () {
                    Navigator.pop(context);
                  }, child: Text('Batal'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
