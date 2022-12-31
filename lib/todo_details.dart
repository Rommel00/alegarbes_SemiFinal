import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TodoDetails extends StatefulWidget {
  final String? number;
  const TodoDetails({Key? key, required this.number}) : super(key: key);

  @override
  State<TodoDetails> createState() => _TodoDetailsState();
}

class _TodoDetailsState extends State<TodoDetails> {
  Map todo = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get one TODO Details"),
      ),
      body: todo.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Container(
              height: MediaQuery.of(context).size.height / 4,
              margin: const EdgeInsets.all(30.0),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  // shadow color and radius
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "ID: ${todo['id']}",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Title: ${todo['title']}",
                    style: const TextStyle(fontSize: 25),
                  ),
                  Text(
                    "completed: ${todo['completed']}",
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
    );
  }

  @override
  void initState() {
    getOneTodo();
    super.initState();
  }

  getOneTodo() async {
    var url = 'https://jsonplaceholder.typicode.com/todos/${widget.number}';
    var response = await http.get(Uri.parse(url));

    setState(() {
      todo = convert.jsonDecode(response.body) as Map;
      /*back if empty from api */
      if (todo.isEmpty) {
        Navigator.of(context).pop();
      }
      print(todo);
    });
  }
}
