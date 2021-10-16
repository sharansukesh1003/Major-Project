import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wasd_front_end/app/credentials/credentials.dart';
import 'package:wasd_front_end/utils/imagepicker_util.dart';
import 'package:wasd_front_end/utils/snack_bar.dart';

class UtilityNotifier extends ChangeNotifier {
  String ? _userimage = "";
  String ? get userimage => _userimage;
  // ignore: unnecessary_new, unused_field
  final ImageUtility _imageUtility = new ImageUtility();
  Future uploadUserImage({required BuildContext context}) async {
    final _cloudinary = Cloudinary(ColudinaryCredentials.APIKey, ColudinaryCredentials.APISecret, ColudinaryCredentials.CLOUDNAME);
    try {
      final _image = await ImageUtility.getImage();
      await _cloudinary.uploadFile(
        filePath: _image!.path,
        resourceType: CloudinaryResourceType.image,
        folder: "wasd",
      ).then((value) {
        _userimage = value.url;
        // ignore: avoid_print
        print(_userimage);
        notifyListeners();
        return _userimage;
      });
    } catch (e) {
      SnackBarUtility.showSnackBar(message: e.toString() ,context: context);
    }
  }
}