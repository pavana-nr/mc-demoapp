import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);
  void addTodo(String title) {
    if (title.isEmpty) {
      addError('Title cannot be empty', StackTrace.current);
      return;
    }
    final todo = Todo(createdAt: DateTime.now(), name: title);
    emit([...state, todo]);
  }

  @override
  void onChange(Change<List<Todo>> change) {
    // TODO: implement onChange
    super.onChange(change);
    if (kDebugMode) {
      print('Todo Cubit:$change');
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    if (kDebugMode) {
      print('Todo Cubit:$error');
    }
  }
}
