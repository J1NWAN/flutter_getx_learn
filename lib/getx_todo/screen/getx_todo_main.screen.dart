import 'package:flutter/material.dart';
import 'package:flutter_getx_learn/getx_todo/controller/getx_todo_controller.dart';
import 'package:get/get.dart';

class GetxTodoMainScreen extends StatelessWidget {
  GetxTodoMainScreen({super.key});

  final controller = Get.put(GetxTodoController());
  final contentController = TextEditingController();

  void openDialog(int? index) {
    if (index != null) {
      final todo = controller.todos[index];
      contentController.text = todo.content;
    }

    Get.dialog(
      AlertDialog(
        title: const Text('일정 추가'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: contentController,
              decoration: const InputDecoration(
                hintText: '일정을 입력해주세요.',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (index == null) {
                controller.addTodo(contentController.text);
              } else {
                controller.updateTodo(index, contentController.text);
              }
              contentController.clear();
              Get.back();
            },
            child: const Text('저장'),
          ),
          TextButton(
            onPressed: () {
              contentController.clear();
              Get.back();
            },
            child: const Text('취소'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Todo 예제'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  openDialog(null);
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          Expanded(
            child: Obx(
              () {
                return ListView.builder(
                  itemCount: controller.todos.length,
                  itemBuilder: (context, index) {
                    return buildTodoItem(controller.todos[index], index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTodoItem(Todo todo, int index) {
    return GestureDetector(
      onTap: () {
        openDialog(index);
      },
      child: Obx(
        () => Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
            color: todo.isCompleted.value ? const Color.fromRGBO(100, 100, 100, 0.5) : Colors.black,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(todo.content),
              Row(
                children: [
                  Checkbox(
                    value: todo.isCompleted.value,
                    onChanged: (value) {
                      controller.toggleTodo(todo);
                    },
                  ),
                  IconButton(
                    onPressed: () {
                      controller.deleteTodo(index);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
