import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/login-page/login.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/model/detail.dart';
import 'new-details.dart';
import 'package:flutter_application_1/view-model/details/details-list.dart';
import 'package:flutter_application_1/view/main_screen.dart';
import 'package:flutter_application_1/model/controller/internationlization/get_multi_language.dart';
import 'package:flutter_application_1/model/controller/internationlization/languages.dart';
import 'package:flutter_application_1/main.dart';

class FillDetails extends StatefulWidget {
  const FillDetails({super.key});

  @override
  State<FillDetails> createState() => _FillDetailsState();
}

class _FillDetailsState extends State<FillDetails> {
  final List<Detail> _showDetails = [
    Detail(
        email: 'example@gmail.com',
        firstName: 'firstName example',
        lastName: 'lastName example',
        number: 09124315657)
  ];
  void _openNewLayOut() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewDetails(
        onAddExpense: _addDetails,
      ),
    );
  }

  void _addDetails(Detail details) {
    setState(() {
      _showDetails.add(details);
    });
  }

  void _removeDetails(Detail details) {
    final detailsIndex = _showDetails.indexOf(details);
    setState(() {
      _showDetails.remove(details);
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
          content: Text('item deleted'.tr),
          action: SnackBarAction(
            label: 'undo'.tr,
            onPressed: () {
              setState(() {
                _showDetails.insert(detailsIndex, details);
              });
            },
          ),
        ),
      );
    });
  }

  final myController = Get.put(GetMultiLanguage());
  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text('please add some details'.tr),
    );
    if (_showDetails.isNotEmpty) {
      mainContent = Detailslist(
        detail: _showDetails,
        remover: _removeDetails,
      );
    }
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'chart'.tr,
              textAlign: TextAlign.start,
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<Languages>(
                    underline: const SizedBox(),
                    icon: const Icon(Icons.language, color: Colors.white),
                    onChanged: (Languages? languages) {
                      if (languages != null) {
                        myController.changeLanguage(
                            languages.languageCode, languages.country);
                      }
                    },
                    items: Languages.languageList()
                        .map<DropdownMenuItem<Languages>>(
                          (e) => DropdownMenuItem<Languages>(
                            value: e,
                            child: Row(
                              children: <Widget>[Text(e.name.toUpperCase())],
                            ),
                          ),
                        )
                        .toList()),
              ),
            ],
          ),
          body: Center(
            child: Column(
              children: [
                const SizedBox(height: 30),
                TextButton(
                  onPressed: _openNewLayOut,
                  child: Text('Add some details'.tr),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(child: mainContent),
              ],
            ),
          ),
          floatingActionButton: Container(
            margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton.extended(
                    onPressed: () {
                      Get.to(() =>  MainScreen());
                    },
                    label: Text('go to main page'.tr)),
                FloatingActionButton.extended(
                    onPressed: () {
                      Get.to(() => Login());
                    },
                    label: Text('log out'.tr)),
              ],
            ),
          )),
    );
  }
}
