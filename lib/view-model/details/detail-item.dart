import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/detail.dart';

class DetailItem extends StatelessWidget {
  const DetailItem(this.detail, {super.key});
  final Detail detail;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(
              detail.firstName,
            ),
             const SizedBox(height: 4),
            Text(
              detail.lastName,
            ),
              const SizedBox(height: 4),
            Text(
              detail.email,
            ),
            const SizedBox(height: 4),
            //i didnt find a better way for handle this zero!!
            Text('+98${detail.number}'),
          ],
        ),
      ),
    );
  }
}
