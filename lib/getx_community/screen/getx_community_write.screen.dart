import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_learn/getx_community/controller/getx_community_controller.dart';
import 'package:flutter_getx_learn/getx_community/screen/getx_community_view.dart';
import 'package:get/get.dart';

class GetxCommunityWriteScreen extends StatelessWidget {
  GetxCommunityWriteScreen({super.key, this.index});

  final int? index;
  final GetxCommunityController controller = Get.find();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (index != null) {
      final post = controller.posts[index!];
      titleController.text = post.title;
      contentController.text = post.content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(index != null ? '수정' : '글쓰기'),
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
                if (index != null) {
                  controller.updatePost(index!, titleController.text, contentController.text);
                  Get.to(() => GetxCommunityViewScreen(index: index!));
                } else {
                  controller.addPost(titleController.text, contentController.text);
                  Get.back();
                }
              } else {
                Get.snackbar('오류', '제목과 내용을 모두 입력해주세요.');
              }
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
