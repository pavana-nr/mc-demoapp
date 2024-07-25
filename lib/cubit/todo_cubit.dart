import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);
  void addTodo(String title) {
    final todo = Todo(createdAt: DateTime.now(), name: title);
    emit([...state, todo]);
  }
}
