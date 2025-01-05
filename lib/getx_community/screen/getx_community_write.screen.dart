import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_learn/getx_community/controller/getx_community_controller.dart';
import 'package:get/get.dart';

class GetxCommunityWriteScreen extends StatelessWidget {
  GetxCommunityWriteScreen({super.key});

  final GetxCommunityController controller = Get.put(GetxCommunityController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('글쓰기'),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            onPressed: () {
              if (titleController.text.isNotEmpty && contentController.text.isNotEmpty) {
                controller.addPost(titleController.text, contentController.text);
              } else {
                Get.snackbar('오류', '제목과 내용을 모두 입력해주세요.');
              }

              titleController.clear();
              contentController.clear();
              Get.back();
            },
            child: const Text('저장'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: '제목',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: contentController,
              decoration: const InputDecoration(
                labelText: '내용',
                border: OutlineInputBorder(),
              ),
              maxLines: 10,
            ),
          ],
        ),
      ),
    );
  }
}
