import 'package:get/get.dart';

class GetxCommunityController extends GetxController {
  RxList<Post> posts = <Post>[].obs;

  void addPost(String title, String content) {
    posts.add(Post(
      title: title,
      content: content,
      createdAt: DateTime.now(),
      readCount: 0.obs,
    ));
  }

  void deletePost(int index) {
    posts.removeAt(index);
  }

  void updateReadCount(int index) {
    posts[index].readCount.value++;
  }

  void updatePost(int index, String title, String content) {
    final currentPost = posts[index];
    posts[index] = Post(
      title: title,
      content: content,
      createdAt: currentPost.createdAt,
      readCount: currentPost.readCount,
    );
  }
}

class Post {
  final String title;
  final String content;
  final DateTime createdAt;
  final RxInt readCount;

  Post({
    required this.title,
    required this.content,
    required this.createdAt,
    required this.readCount,
  });
}
