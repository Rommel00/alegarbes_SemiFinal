import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetAllTodos extends StatefulWidget {
  const GetAllTodos({Key? key}) : super(key: key);

  @override
  State<GetAllTodos> createState() => _GetAllTodosState();
}

class _GetAllTodosState extends State<GetAllTodos> {
  /*init tod0 list*/
  List todos = <dynamic>[];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index]['title']),
            leading: CircleAvatar(
              child: Text("${index + 1}"),
            ),
            onTap: () {},
          );
        });
  }

  /*get list from api*/
  getTodo() async {
    var url = 'https://jsonplaceholder.typicode.com/todos';
    var response = await http.get(Uri.parse(url));

    setState(() {
      todos = convert.jsonDecode(response.body) as List<dynamic>;
    });
  }

  /*init - get all tod0*/
  @override
  void initState() {
    getTodo();
    super.initState();
  }
}
