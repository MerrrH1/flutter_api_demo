import 'package:flutter/material.dart';
import 'package:latihan_api_demo/ui/menu_resto/menu_resto_page.dart';
import 'package:latihan_api_demo/ui/order_menu/order_menu_page.dart';
import 'package:latihan_api_demo/ui/table_resto/table_resto_page.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MainScreen());
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const TableRestoPage(),
    const MenuRestoPage(),
    const OrderMenuPage()
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.table_bar), label: 'Meja'),
          BottomNavigationBarItem(icon: Icon(Icons.fastfood), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.dining), label: 'Pesanan')
        ],
      ),
    );
  }
}
