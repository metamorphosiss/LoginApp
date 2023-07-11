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
        enterdAmount.toString().length != 11;
    if (_controlEmail.text.trim().isEmpty ||
        _controlFirstName.text.trim().isEmpty ||
        enteredFirstName ||
        enteredlastName ||
        _controlLastName.text.trim().isEmpty ||
        isEditingAmount) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('invalid value'),
          content: const Text(
              '[please make sure that you have entered valid phone number,email,firstname,lastname or fill all objects]'),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('OK'))
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
          number: enterdAmount ),
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
              decoration: const InputDecoration(
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                label: Text('write your first name'),
              ),
            ),
            TextField(
              controller: _controlLastName,
              maxLength: 50,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                label: Text('write your last name'),
              ),
            ),
            TextField(
              controller: _controlEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                label: Text('write your email'),
              ),
            ),
            TextField(
              controller: _controlNum,
              maxLength: 11,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('write ur own phone number'),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: _submitExpenseData,
              child: const Text('save Detail'),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
