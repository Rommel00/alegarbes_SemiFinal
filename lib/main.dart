import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController tabController;

  /*init*/
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Alegarbes Todo"),
          bottom: TabBar(
            controller: tabController,
            tabs: const [
              Tab(child: Text('Get All Todos')),
              Tab(child: Text('Get One Todo')),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: const [
            Center(child: Icon(Icons.home)),
            Center(child: Icon(Icons.account_circle))
          ],
        ),
      ),
    );
  }
}
