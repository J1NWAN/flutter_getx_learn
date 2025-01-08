import 'package:get/get.dart';

class GetxTodoController extends GetxController {
  RxList<Todo> todos = <Todo>[].obs;

  void addTodo(String content) {
    todos.add(Todo(
      content: content,
      createdAt: DateTime.now(),
      isCompleted: false.obs,
    ));
  }

  void deleteTodo(int index) {
    todos.removeAt(index);
  }

  void updateTodo(int index, String content) {
    final currentTodo = todos[index];
    todos[index] = Todo(
      content: content,
      createdAt: currentTodo.createdAt,
      isCompleted: currentTodo.isCompleted,
    );
  }

  void toggleTodo(Todo todo) {
    todo.isCompleted.value = !todo.isCompleted.value;
  }
}

class Todo {
  final String content;
  final DateTime createdAt;
  final RxBool isCompleted;

  Todo({
    required this.content,
    required this.createdAt,
    required this.isCompleted,
  });
}
