import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportlingo/ui/pages/content/posts/post_page.dart';
import 'package:sportlingo/ui/utils/colors.dart';
import 'package:sportlingo/ui/utils/scroll_layout.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final TextEditingController _textFieldController = TextEditingController();

  final Key _textFieldKey = const Key("createPostPageTextField");

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Create Post"),
          surfaceTintColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: amber,
              height: 4.0,
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                  Get.to(() => PostPage());
                },
                child: const Text("Post"))
          ],
          shadowColor: Colors.black,
        ),
        body: ScrollLayout(
          alignment: Alignment.topLeft,
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      key: _textFieldKey,
                      controller: _textFieldController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "What's happening?",
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
