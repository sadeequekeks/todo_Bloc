part of 'todo_bloc.dart';

class TodoState {
  final List<String> todos;

  TodoState(this.todos);
}

class TodoInitial extends TodoState {
  TodoInitial({required List<String> todos}) : super(todos);
}
