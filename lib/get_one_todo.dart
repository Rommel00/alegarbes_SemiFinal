import 'package:flutter/material.dart';

class GetOneTodo extends StatefulWidget {
  const GetOneTodo({Key? key}) : super(key: key);

  @override
  State<GetOneTodo> createState() => _GetOneTodoState();
}

class _GetOneTodoState extends State<GetOneTodo> {
  TextEditingController indexController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /*heading text*/
          const Text("Input number (1-200)"),

          /*input field*/
          TextField(
            controller: indexController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Input number',
              labelText: '(1 - 200)',
            ),
          ),

          /*button*/
          Container(
            margin: const EdgeInsets.only(top: 25),
            child: ElevatedButton(
              onPressed: () {
                print(indexController.text);
              },
              child: const Text("Submit"),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    indexController.dispose();
    super.dispose();
  }
}
