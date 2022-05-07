import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasd_front_end/constants/constants.dart';
import 'package:wasd_front_end/core/notifier/post_notifier.dart';
import 'package:wasd_front_end/core/services/post_service.dart';

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({ Key? key }) : super(key: key);

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  PostNotifier postNotifier(bool renderUri) => Provider.of<PostNotifier>(context,listen: renderUri);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.backgroundColor,
      appBar: AppBar(
          backgroundColor: ConstantColors.primaryColor,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Image(image: AssetImage('lib/static/logo.png'),height: 85,width: 85),
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
                  SizedBox(height: 50, width: double.infinity,),
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
              const SizedBox(height: 15,),
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
                  await postNotifier(false).uploadUserImage(context: context);
                  var image = postNotifier(false).uploadedImageUrl;
                  var data = await PostsAPI.profilePic(image!);
                  if (data['success']) {
                    postNotifier(false).removeImages();
                    ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                          content: Text(data['message']),)
                      );
                      Navigator.pop(context);
                  }
                  else {
                    postNotifier(false).removeImages();
                    ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                          content: Text(data.message),)
                      );
                  }
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