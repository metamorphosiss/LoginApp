import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
// import 'package:image_cropper/image_cropper.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';

class ImagePickerController extends GetxController {
  Rx<File> image = File('').obs;
  Future imagePicker() async {
    try {
      final imagePick =
          // if u want to pick from camera  u can write camera instead of gallery bellow
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imagePick == null) {
        return;
      }
        var imageTemp = File(imagePick.path);
      image.value = imageTemp;
    } on PlatformException catch (e) {
      return e;
    }
  }

  
}
