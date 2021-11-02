// ignore_for_file: avoid_print, non_constant_identifier_names
import 'dart:convert';
import 'dart:io';
import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wasd_front_end/app/credentials/credentials.dart';
import 'package:wasd_front_end/core/api/post_api.dart';
import 'package:wasd_front_end/core/dto/post_dto.dart';
import 'package:wasd_front_end/core/model/post_model.dart';
import 'package:wasd_front_end/utils/snack_bar.dart';

class PostNotifier extends ChangeNotifier{
  final PostAPI _postAPI = PostAPI();

  File? _selectedPostImage;
  File? get selectedPostImage => _selectedPostImage;
  
  String? _uploadedImageUrl;
  String? get uploadedImageUrl => _uploadedImageUrl;

  Future addPost({
    required BuildContext context,
    required PostDTO postDTO
  }) async{
    try{
      await _postAPI.addPost(postDTO);
    }
    catch(error){
      print(error);
    }
  }

  Future fetchPost({required BuildContext context}) async{
    try{
      var response = await _postAPI.fetchPost();
      print(response);
      var modelledData = Post.fromJson(jsonDecode(response));
      var postCode = modelledData.code;
      var postData = modelledData.data;
      bool isPostReceived = modelledData.received;
      if(isPostReceived){
        switch(postCode){
          case 200:
          {
            print(postData);
            return postData;
          }
        }
      }
      print(modelledData.data);
      // print(response);
    }
    catch(error){
      print(error);
    }
  }

  Future uploadUserImage({required BuildContext context}) async {
    final _cloudinary = Cloudinary(ColudinaryCredentials.APIKey, ColudinaryCredentials.APISecret, ColudinaryCredentials.CLOUDNAME);
    try {
      print("uploading image");
      await _cloudinary.uploadFile(
        filePath: _selectedPostImage!.path,
        resourceType: CloudinaryResourceType.image,
        folder: "wasd",
      ).then((value) {
        _uploadedImageUrl = value.url;
        if(_uploadedImageUrl != null){
          SnackBarUtility.showSnackBar(message: "Post Uploaded" ,context: context);
        }
        notifyListeners();
        return _uploadedImageUrl;
      });
    } catch (e) {
      SnackBarUtility.showSnackBar(message: e.toString() ,context: context);
    }
  }

  Future<File?> pickPostImage() async {
    final _image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(_image != null){
      _selectedPostImage = File(_image.path);
      notifyListeners();
    }
    return null;
  }

  removeImages(){
    _selectedPostImage = null;
    notifyListeners();
  }
}