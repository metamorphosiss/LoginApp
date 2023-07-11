import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

class Comments extends StatefulWidget {
  const Comments({super.key});
  @override
  State<Comments> createState() => _HomePageState();
}

class _HomePageState extends State<Comments> {
 List listData =[] ;
  //there are a lot way for fetching data like Dio or try  & catch

  @override
  void initState() {
    Future getData() async {
      final url = Uri.parse('https://jsonplaceholder.typicode.com/comments');
      // can also wirte like this  instead of final=> http.Response response ;
      final response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          final List mapResponse = jsonDecode(response.body);
          listData = mapResponse;
        });
      }
    }

    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: listData.length,
          itemBuilder: (ctx, index) => Center(
            child: Column(
              children: [
                Row(
                  children: [
                   
                      Text(listData[index]["postId"].toString()),
                   
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 0),
                        child: Column(
                          children: [
                            Text(listData[index]["name"].toString()),
                            Text(listData[index]["email"].toString()),
                            Text(listData[index]["body"].toString(),textAlign:TextAlign.center ,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Get.back();
            },
            label: const Text('back to main page')));
  }
}
