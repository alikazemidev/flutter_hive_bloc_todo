import 'dart:async';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../models/todo_model.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState(todoEvent: InitialTodoEvent())) {
    on<FetchingTodoEvent>(_fetchingTodo);
  }

  FutureOr<void> _fetchingTodo(
      FetchingTodoEvent event, Emitter<TodoState> emit) async {
    emit(state.copyWith(todoEvent: LoadingTodoEvent()));

    await Hive.openBox<TodoModel>('todoBox');
    final box = Hive.box<TodoModel>('todoBox');

    emit(
      state.copyWith(
        todoEvent: CompletedTodoEvent(
          todoModel: box.values.toList(),
        ),
      ),
    );


  }
}
