// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, avoid_print, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasd_front_end/constants/constants.dart';
import 'package:wasd_front_end/core/notifier/post_notifier.dart';
import 'package:wasd_front_end/core/services/cacheservice.dart';
import 'package:wasd_front_end/core/services/post_service.dart';

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
      backgroundColor: ConstantColors.primaryColor,
      appBar: AppBar(
        backgroundColor: ConstantColors.backgroundColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
          Text("P",
            style: TextStyle(
              color: ConstantColors.secondaryColor,
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
            ),
            Text("ost",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
            ),
          ],
        ),
      ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              postNotifier(true).selectedPostImage != null ? Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image:FileImage(
                      postNotifier(true).selectedPostImage!)
                      )
                ),
              ) : Column(
                children: const [
                  SizedBox(height: 50,),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: ConstantColors.secondaryColor,
                    child: Icon(
                      Icons.photo_library_outlined,
                      size: 50,
                      color: Colors.white,
                      ),
                  ),
                  SizedBox(height: 25,),
                  Text ("Choose Image From Gallery",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white
                  ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                      controller: titleController,
                      cursorHeight: 15.0,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                        hintStyle: TextStyle(
                          color: Colors.white54
                        ),
                        focusColor: Colors.white,
                        hintText: "Enter title",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        )
                      ),
                    ),
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                color: ConstantColors.secondaryColor,
                onPressed: () {
                postNotifier(false).pickPostImage();
              }, 
                child: Text(
                  postNotifier(true).selectedPostImage != null ? "Reselect Image" : "Select Image",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                  ),
                  ) 
                ),
                if(postNotifier(true).selectedPostImage != null) MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  color: ConstantColors.secondaryColor,
                  onPressed: (){
                    postNotifier(false).removeImages();
                  }, 
                  child: const Text("Remove Image",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                  ),
                ),
                  ),
              MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                color: ConstantColors.secondaryColor,
                onPressed: () async {
                  CacheService cacheService = CacheService();
                  var id = await cacheService.readCache(key: "id");
                  await postNotifier(false).uploadUserImage(context: context);
                  var image = postNotifier(false).uploadedImageUrl;
                  var data = await PostsAPI.post(titleController.text, image!, id);
                  if (data['success']) {
                    ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                          content: Text(data['message']),)
                      );
                      Navigator.pop(context);
                  }
                  else {
                    ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                          content: Text(data.message),)
                      );
                  }
                  postNotifier(false).removeImages();
                }, 
                child: const Text("Upload Image",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      ),
                    ),
                )
              ],
            ),
        ),
    );
  }
}