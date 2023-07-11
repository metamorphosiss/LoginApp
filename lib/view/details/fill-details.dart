import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/model/detail.dart';
import 'new-details.dart';
import 'package:flutter_application_1/view-model/details/details-list.dart';
import 'package:flutter_application_1/view/main-screen.dart';

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
          content: const Text('item deleted'),
          action: SnackBarAction(
            label: 'undo',
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

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('please add some details'),
    );
    if (_showDetails.isNotEmpty) {
      mainContent = Detailslist(
        detail: _showDetails,
        remover: _removeDetails,
      );
    }
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Text('chart'),
              const SizedBox(height: 20),
              TextButton(
                onPressed: _openNewLayOut,
                child: const Text('Add some details'),
              ),
              Expanded(child: mainContent),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Get.to(() => const MainScreen());
            },
            label: const Text('go to main page')),
      ),
    );
  }
}
