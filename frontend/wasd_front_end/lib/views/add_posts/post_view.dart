// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, avoid_print, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasd_front_end/core/dto/post_dto.dart';
import 'package:wasd_front_end/core/notifier/authentication_notifier.dart';
import 'package:wasd_front_end/core/notifier/post_notifier.dart';
import 'package:wasd_front_end/utils/snack_bar.dart';

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
    PostNotifier postNotifier(bool renderUri) => Provider.of<PostNotifier>(context,listen: renderUri);
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
              postNotifier(true).selectedPostImage != null ? Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:FileImage(
                      postNotifier(true).selectedPostImage!)
                      )
                ),
              ) : const Text ("uPL;OAD"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget> [
                    ElevatedButton(
                    onPressed: (){
                    postNotifier(false).pickPostImage();
                  }, 
                    child: Text(postNotifier(true).selectedPostImage != null ? "Reselect Image" : "Select Image") 
                    ),
                    if(postNotifier(true).selectedPostImage != null) ElevatedButton(
                      onPressed: (){
                        postNotifier(false).removeImages();
                      }, child: const Text("Remove")
                      )
                  ],
                ),
                ElevatedButton(
                onPressed: () async {
                  final authenticationNotifier = Provider.of<AuthenticationNotifier>(context, listen: false);
                  var user_email = await authenticationNotifier.fetchUserEmail(context: context);
                  var post_title = titleController.text;
                  var post_image = postNotifier(false).uploadedImageUrl;
                  await postNotifier(false).uploadUserImage(context: context);
                  if(post_image != null) {
                    await postNotifier(false).addPost(
                      context : context,
                      postDTO: PostDTO(
                        post_images: post_image,
                        post_title: post_title,
                        useremail: user_email
                      )
                    ).whenComplete(() => SnackBarUtility.showSnackBar(message: "Posted" ,context: context));
                  }
                  else{
                    SnackBarUtility.showSnackBar(message: "Please Select an Image" ,context: context);
                  }
                }, 
                child: const Text("Upload Image")
                )
              ],
            ),
        ),
    );
  }
}