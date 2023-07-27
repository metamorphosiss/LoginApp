import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/detail.dart';
import 'package:get/get.dart';

class NewDetails extends StatefulWidget {
  const NewDetails({super.key, required this.onAddExpense});
  final void Function(Detail detail) onAddExpense;
  @override
  State<NewDetails> createState() => _NewDetailsState();
}

class _NewDetailsState extends State<NewDetails> {
  final _controlNum = TextEditingController();
  final _controlEmail = TextEditingController();
  final _controlFirstName = TextEditingController();
  final _controlLastName = TextEditingController();
  @override
  void dispose() {
    _controlNum.dispose();
    _controlEmail.dispose();
    _controlFirstName.dispose();
    _controlLastName.dispose();
    super.dispose();
  }

  void _submitExpenseData() {
    final enterdAmount = int.tryParse(_controlNum.text);
    final enteredFirstName = _controlFirstName.text.isNum;
    final enteredlastName = _controlLastName.text.isNum;
    final isEditingAmount = enterdAmount == null ||
        enterdAmount <= 0 ||
        enterdAmount.toString().length != 10;
    if (_controlEmail.text.trim().isEmpty ||
        _controlFirstName.text.trim().isEmpty ||
        enteredFirstName ||
        enteredlastName ||
        _controlLastName.text.trim().isEmpty ||
        isEditingAmount) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('invalid value'.tr),
          content: Text(
              '[please make sure that you have entered valid phone number,email,firstname,lastname or fill all objects]'
                  .tr),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('OK'.tr))
          ],
        ),
      );
      return;
    }

    widget.onAddExpense(
      Detail(
          email: _controlEmail.text,
          firstName: _controlFirstName.text,
          lastName: _controlLastName.text,
          number: enterdAmount),
    );
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
        child: Column(
          children: [
            TextField(
              controller: _controlFirstName,
              maxLength: 10,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                label: Text('write your first name'.tr),
              ),
            ),
            TextField(
              controller: _controlLastName,
              maxLength: 50,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                label: Text('write your last name'.tr),
              ),
            ),
            TextField(
              controller: _controlEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                label: Text('write your email'.tr),
              ),
            ),
            TextField(
              controller: _controlNum,
              maxLength: 11,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text('write ur own phone number'.tr),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: _submitExpenseData,
              child: Text('save Detail'.tr),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('cancel'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
