import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial(todos: [])) {
    on<TodoEvent>((event, emit) {
      emit(TodoInitial(todos: []));
    });
    on<AddTodoEvent>((event, emit) {
      List<String> updatedTodos = List.from(state.todos);
      updatedTodos.add(event.todo);
      emit(TodoInitial(todos: updatedTodos));
    });
    on<RemoveTodoEvent>((event, emit) {
      List<String> updatedTodos = List.from(state.todos);
      if (event.index >= 0 && event.index < updatedTodos.length) {
        updatedTodos.removeAt(event.index);
        emit(TodoInitial(todos: updatedTodos));
      } else {
        // Handle the case where the index is out of bounds.
        // You can choose to ignore it or handle it in a way that makes sense for your app.
        print('Invalid index: ${event.index}');
      }
    });
    on<EditTodoEvent>((event, emit) {
      List<String> updatedTodos = List.from(state.todos);
      updatedTodos[event.index] = event.newTodo;
      emit(TodoInitial(todos: updatedTodos));
    });
  }
}
