import 'package:flutter/material.dart';

class OrderMenuPage extends StatefulWidget {
  const OrderMenuPage({super.key});

  @override
  State<OrderMenuPage> createState() => _OrderMenuPageState();
}

class _OrderMenuPageState extends State<OrderMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pesanan'),backgroundColor: Theme.of(context).colorScheme.inversePrimary),
    );
  }
}
