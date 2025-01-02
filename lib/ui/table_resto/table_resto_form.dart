import 'package:flutter/material.dart';
import 'package:latihan_api_demo/models/table_resto_model.dart';
import 'package:latihan_api_demo/param/table_resto_param.dart';
import 'package:latihan_api_demo/responses/table_resto_response.dart';
import 'package:latihan_api_demo/services/table_resto_service.dart';

class TableRestoForm extends StatefulWidget {
  final TableRestoModel? tableRestoModel;
  const TableRestoForm({super.key, required this.tableRestoModel});

  @override
  State<TableRestoForm> createState() => _TableRestoFormState();
}

class _TableRestoFormState extends State<TableRestoForm> {
  final tableServices = TableRestoService();
  late Future<TableRestoResponse> futureTableCreate;
  late Future<TableRestoResponse> futureTableUpdate;
  final globalKey = GlobalKey<FormState>();
  final tecName = TextEditingController();
  final tecCode = TextEditingController();
  final tecCapacity = TextEditingController();

  String? selectedStatus = "Aktif";
  String? selectedTableStatus = "Kosong";
  final List<String> statusOption = ['Aktif', 'Tidak Aktif'];
  final List<String> tableStatusOption = ['Kosong', 'Terisi'];

  @override
  void initState() {
    super.initState();
    // futureTableCreate = tableServices.addTable(TableRestoParam(code: '14', name: 'Meja baru', capacity: 15));
    // futureTableUpdate = tableServices.updateTable(
    //     3, TableRestoParam(code: '3', name: 'Meja Tiga', capacity: 6, tableStatus: 'Terisi', status: 'Aktif'));
    if (widget.tableRestoModel != null) {
      tecName.text = widget.tableRestoModel!.name;
      tecCode.text = widget.tableRestoModel!.code;
      tecCapacity.text = widget.tableRestoModel!.capacity.toString();
      selectedTableStatus = widget.tableRestoModel!.tableStatus;
      selectedStatus = widget.tableRestoModel!.status;
    }
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
      body: SingleChildScrollView(
        child: Form(
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
                  validator: (value) => value == null || value.isEmpty
                      ? "Masukkan nama meja"
                      : null,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: tecCode,
                  decoration: InputDecoration(
                      label: Text(
                        'Kode meja : ',
                      ),
                      hintText: "Masukkan kode meja"),
                  validator: (value) => value == null || value.isEmpty
                      ? "Masukkan kode meja"
                      : null,
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
                DropdownButtonFormField(
                  value: selectedTableStatus,
                  decoration: InputDecoration(label: Text('Status Meja')),
                  items: tableStatusOption
                      .map((status) => DropdownMenuItem(
                            value: status,
                            child: Text(status),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedTableStatus = value;
                    });
                  },
                  validator: (value) =>
                      value == null ? "Pilih status meja" : null,
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  value: selectedStatus,
                  decoration: InputDecoration(label: Text('Status')),
                  items: statusOption
                      .map((status) => DropdownMenuItem(
                            value: status,
                            child: Text(status),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedStatus = value;
                    });
                  },
                  validator: (value) => value == null ? "Pilih status" : null,
                ),
                SizedBox(
                  height: 20,
                ),
                OverflowBar(
                  alignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (globalKey.currentState!.validate()) {
                            if (widget.tableRestoModel == null) {
                              futureTableCreate = tableServices.addTable(
                                  TableRestoParam(
                                      code: tecCode.text,
                                      name: tecName.text,
                                      capacity: int.parse(tecCapacity.text),
                                      tableStatus:
                                          selectedTableStatus.toString(),
                                      status: selectedStatus.toString()));
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Data berhasil disimpan')));
                              Navigator.pop(context);
                            } else {
                              futureTableUpdate = tableServices.updateTable(
                                  widget.tableRestoModel!.id,
                                  TableRestoParam(
                                      code: tecCode.text,
                                      name: tecName.text,
                                      capacity: int.parse(tecCapacity.text),
                                      tableStatus:
                                          selectedTableStatus.toString(),
                                      status: selectedStatus.toString()));
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Data berhasil diubah')));
                              Navigator.pop(context);
                            }
                          }
                        },
                        child: Text('Simpan')),
                    OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Batal'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
