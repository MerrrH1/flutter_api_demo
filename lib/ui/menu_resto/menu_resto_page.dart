import 'package:flutter/material.dart';

class MenuRestoPage extends StatefulWidget {
  const MenuRestoPage({super.key});

  @override
  State<MenuRestoPage> createState() => _MenuRestoPageState();
}

class _MenuRestoPageState extends State<MenuRestoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu'),backgroundColor: Theme.of(context).colorScheme.inversePrimary),
    );
  }
}
