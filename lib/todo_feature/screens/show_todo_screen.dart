import 'package:flutter/material.dart';

class ShowTodoScreen extends StatelessWidget {
  static const routeName = '/show_todo_screen';

  const ShowTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: const Center(
        child: Text(
          'add todo',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
