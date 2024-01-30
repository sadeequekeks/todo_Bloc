part of 'todo_bloc.dart';

abstract class TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final String todo;

  AddTodoEvent(this.todo);
}

class RemoveTodoEvent extends TodoEvent {
  final int index;

  RemoveTodoEvent(this.index);
}

class EditTodoEvent extends TodoEvent {
  final int index;
  final String newTodo;

  EditTodoEvent(this.index, this.newTodo);
}
