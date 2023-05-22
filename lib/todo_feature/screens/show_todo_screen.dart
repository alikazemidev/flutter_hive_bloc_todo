import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_block_note_app/todo_feature/logic/bloc/todo_bloc.dart';
import 'package:hive_block_note_app/todo_feature/models/todo_model.dart';
import 'package:hive_block_note_app/tools/loading_widget.dart';

class ShowTodoScreen extends StatefulWidget {
  static const routeName = '/show_todo_screen';

  const ShowTodoScreen({Key? key}) : super(key: key);

  @override
  State<ShowTodoScreen> createState() => _ShowTodoScreenState();
}

class _ShowTodoScreenState extends State<ShowTodoScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<TodoBloc>().add(FetchingTodoEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if (state.todoEvent is LoadingTodoEvent) {
              return const Center(child: LoadingWidget());
            }
            if (state.todoEvent is CompletedTodoEvent) {
              final CompletedTodoEvent event =
                  state.todoEvent as CompletedTodoEvent;
              List<TodoModel> todoModel = event.todoModel;
              return todoModel.isEmpty
                  ? const Center(
                      child: Text('کاری برای انحام نیست'),
                    )
                  : ListView.builder(
                      itemCount: todoModel.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(todoModel[index].title),
                          subtitle: Text(todoModel[index].description),
                        );
                      },
                    );
            }
            return const Center(child: Text('error'));
          },
        ));
  }
}
