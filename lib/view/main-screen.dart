import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'image-picker.dart';
import 'map-view/map.dart';
import 'comments.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              TextButton(
                  onPressed: () {
                    Get.to(
                      () => const Maplocation()
                      );
                  },
                  child: const Text('show me current  location')),
                  const SizedBox(height: 40,),
              TextButton(
                  onPressed: () {
                    Get.to(
                      () => const Comments()
                      );
                  },
                  child: const Text('show me commends')),
                      const SizedBox(height: 40,),
              TextButton(
                  onPressed: () {
                    Get.to(
                      () => const ImagePicker()
                      );
                  },
                  child: const Text('insert image')),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.back();
          },
          label: const Text('back'),
        ),
      ),
    );
  }
}
