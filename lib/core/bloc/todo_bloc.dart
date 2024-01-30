import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState([])) {
    on<TodoEvent>((event, emit) {
      emit(TodoState([]));
    });
  }

  Stream<void> mapEventToState(TodoEvent event) async* {
    if (event is AddTodoEvent) {
      List<String> updatedTodos = List.from(state.todos);
      updatedTodos.add(event.todo);
      yield TodoState(updatedTodos);
    } else if (event is RemoveTodoEvent) {
      List<String> updatedTodos = List.from(state.todos);
      updatedTodos.removeAt(event.index);
      yield TodoState(updatedTodos);
    } else if (event is EditTodoEvent) {
      List<String> updatedTodos = List.from(state.todos);
      updatedTodos[event.index] = event.newTodo;
      yield TodoState(updatedTodos);
    }
  }
}
