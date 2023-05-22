part of 'todo_bloc.dart';


abstract class TodoEvent {}

class InitialTodoEvent extends TodoEvent {}
class LoadingTodoEvent extends TodoEvent {}

class FetchingTodoEvent extends TodoEvent {}

class CompletedTodoEvent extends TodoEvent {
  final List<TodoModel> todoModel;

  CompletedTodoEvent({required this.todoModel});
}
