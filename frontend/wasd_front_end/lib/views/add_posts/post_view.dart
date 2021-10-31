// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasd_front_end/core/notifier/post_notifier.dart';

class AddPost extends StatefulWidget {
  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final postNotifier = Provider.of<PostNotifier>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Post"),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: "Enter Title"
                ),
              ),
              ElevatedButton(
                onPressed: (){}, 
                child: const Text("Select Image")
                ),
                ElevatedButton(
                onPressed: (){
                  var postTitle = titleController.text;
                  postNotifier.addPost(post_title: postTitle, context : context);
                }, 
                child: const Text("Upload Image")
                )
              ],
            ),
        ),
    );
  }
}