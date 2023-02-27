import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<PostResponseModel> sam = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: sam.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: Colors.blueGrey.shade100,
                      margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Text('User ID : ${sam[index].userId}',
                              style: const TextStyle(fontSize: 10)),
                          const SizedBox(height: 5),
                          Text('ID : ${sam[index].id}',
                              style: const TextStyle(fontSize: 10)),
                              const SizedBox(height: 5),
                          Text('Data : ${sam[index].title}',
                              style: const TextStyle(fontSize: 10)),
                              const SizedBox(height: 5),
                          Text('${sam[index].body}',
                              style: const TextStyle(fontSize: 10)),
                        ]),
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }

  Future<List<PostResponseModel>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        sam.add(PostResponseModel.fromJson(index));
      }
      return sam;
    } else {
      return sam;
    }
  }
}
