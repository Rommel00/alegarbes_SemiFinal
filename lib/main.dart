import 'package:flutter/material.dart';

import 'get_all_todos.dart';
import 'get_one_todo.dart';

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
    return Listener(
      onPointerDown: (_) {
        /*to hide the keyboard*/
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.amber,
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
              Center(child: GetAllTodos()),
              Center(child: GetOneTodo())
            ],
          ),
        ),
      ),
    );
  }
}
