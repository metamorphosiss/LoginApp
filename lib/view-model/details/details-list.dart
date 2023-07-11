import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/detail.dart';
import 'detail-item.dart';
class Detailslist extends StatelessWidget {
  
  const Detailslist({super.key,required this.detail,required this.remover});
  final List <Detail>  detail;
  final void Function(Detail detail) remover ; 

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: detail.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(detail[index]),
        onDismissed: (direction) => remover(detail[index]),
        child: DetailItem(detail[index]),
      ),
    );
  }
}