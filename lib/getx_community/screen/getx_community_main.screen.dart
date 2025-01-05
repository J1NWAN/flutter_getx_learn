import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_learn/getx_community/controller/getx_community_controller.dart';
import 'package:flutter_getx_learn/getx_community/screen/getx_community_view.dart';
import 'package:flutter_getx_learn/getx_community/screen/getx_community_write.screen.dart';
import 'package:get/get.dart';

class GetxCommunityMainScreen extends StatelessWidget {
  GetxCommunityMainScreen({super.key});

  final GetxCommunityController controller = Get.put(GetxCommunityController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX 커뮤니티 예제'),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.pencil_outline),
            onPressed: () {
              Get.to(() => GetxCommunityWriteScreen());
            },
          )
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.posts.length,
          itemBuilder: (context, index) {
            final post = controller.posts[index];
            return GestureDetector(
              onTap: () {
                controller.updateReadCount(index);
                Get.to(() => GetxCommunityViewScreen(index: index));
              },
              child: Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(post.title),
                  subtitle: Text('${post.createdAt.toString().substring(0, 10)} 조회 ${post.readCount.value}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => controller.deletePost(index),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
