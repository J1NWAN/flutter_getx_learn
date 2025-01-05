import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/getx_community_controller.dart';

class GetxCommunityViewScreen extends StatelessWidget {
  GetxCommunityViewScreen({super.key, required this.index});

  final GetxCommunityController controller = Get.find();
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('게시글 상세'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(controller.posts[index].title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16.0),
            Text(controller.posts[index].content, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
