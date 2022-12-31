import 'package:flutter/material.dart';

import 'todo_details.dart';

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
                /*show message if empty*/
                if (indexController.text.isEmpty) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("number field is required."),
                    ),
                  );
                } else {
                  /*check if the input is valid*/
                  if (double.tryParse(indexController.text) == null) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please enter a valid number"),
                      ),
                    );
                  }
                  /*if there's no error next page*/
                  else {
                    if (double.parse(indexController.text) <= 200) {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TodoDetails(number: indexController.text),
                        ),
                      );
                    }
                    /*if the input value is out of range then show error*/
                    else {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "range 1 - 200 only",
                          ),
                        ),
                      );
                    }
                  }
                }
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
