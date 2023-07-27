import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/model/controller/image-controller.dart';

class ImagePicker extends StatelessWidget {
  const ImagePicker({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImagePickerController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Obx(() {
                return Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(color: Colors.grey),
                    child: controller.image.value.path == ''
                        ? const Icon(
                            Icons.account_box_rounded,
                            size: 200,
                          )
                        : Image.file(controller.image.value));
              }),
            ),
            const SizedBox(height: 200),
            ElevatedButton(
              onPressed: () {
                controller.imagePicker();
              },
              child:  Text('pick Image'.tr),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.back();
          },
          label:  Text('back to main page'.tr)),
    );
  }
}
