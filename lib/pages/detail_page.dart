import 'package:flutter/material.dart';
import 'package:temp/models/original_model.dart';
import 'package:temp/models/user_model.dart';

class DetailPage extends StatelessWidget {
  final User user;

  const DetailPage({
    Key key,
    this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Original> demo = user.original;
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: demo.length,
              itemBuilder: (context, index) {
                print(demo[index].guidlineID);
                return Card(
                  child: ListTile(
                    dense: true,
                    title: Text(
                      demo[index].guidlineID.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(demo[index].guidelineText.toString()),
                    ),
                  ),
                  margin: const EdgeInsets.all(0.0),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}