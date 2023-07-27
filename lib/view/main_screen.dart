import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'image-picker.dart';
import 'map-view/map.dart';
import 'comments.dart';
import 'package:flutter_application_1/model/controller/internationlization/languages.dart';
import 'package:flutter_application_1/model/controller/internationlization/get_multi_language.dart';

class MainScreen extends StatelessWidget {
   MainScreen({super.key});
final myController = Get.put(GetMultiLanguage());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
          automaticallyImplyLeading: false,
          title:  Text('main screen'.tr, textAlign: TextAlign.start, ), 
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<Languages>(
                
                underline: const SizedBox(),
                icon: const Icon(Icons.language,color: Colors.white),
                onChanged: (Languages? languages) {
                 if (languages != null) {
                        myController.changeLanguage(
                            languages.languageCode, languages.country);
                      }
                },
                items:
                    Languages.languageList().map<DropdownMenuItem<Languages>>(
                  (e) => DropdownMenuItem<Languages>(
                    value: e,
                    child: Row(
                      children: <Widget>[Text(e.name.toUpperCase())],
                    ),
                  ),
                )
                .toList()
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              TextButton(
                  onPressed: () {
                    Get.to(
                      () => const Maplocation()
                      );
                  },
                  child:  Text('show me current  location'.tr)),
                  const SizedBox(height: 40,),
              TextButton(
                  onPressed: () {
                    Get.to(
                      () => const Comments()
                      );
                  },
                  child:  Text('show me commends'.tr)),
                      const SizedBox(height: 40,),
              TextButton(
                  onPressed: () {
                    Get.to(
                      () => const ImagePicker()
                      );
                  },
                  child:  Text('image selection'.tr)),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.back();
          },
          label:  Text('back'.tr),
        ),
      ),
    );
  }
}
