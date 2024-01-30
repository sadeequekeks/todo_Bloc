import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games/core/bloc/todo_bloc.dart';

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.todos[index]),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        _showEditDialog(context, index);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        BlocProvider.of<TodoBloc>(context)
                            .add(RemoveTodoEvent(index));
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    TextEditingController todoController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Todo'),
          content: TextField(
            controller: todoController,
            decoration: InputDecoration(labelText: 'Todo'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                BlocProvider.of<TodoBloc>(context)
                    .add(AddTodoEvent(todoController.text));
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(BuildContext context, int index) {
    TextEditingController todoController = TextEditingController(
        text: BlocProvider.of<TodoBloc>(context).state.todos[index]);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Todo'),
          content: TextField(
            controller: todoController,
            decoration: InputDecoration(labelText: 'Todo'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                BlocProvider.of<TodoBloc>(context)
                    .add(EditTodoEvent(index, todoController.text));
                Navigator.pop(context);
              },
              child: Text('Edit'),
            ),
          ],
        );
      },
    );
  }
}
