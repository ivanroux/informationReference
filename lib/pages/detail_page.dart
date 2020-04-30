import 'package:flutter/material.dart';
import 'package:temp/models/original_model.dart';
import 'package:temp/models/user_model.dart';
import 'package:temp/pages/search_details_page.dart';

class DetailPage extends StatelessWidget {
  final User user;

  const DetailPage({
    Key key,
    this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Original> originals = user.original;
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchDetailsPage(
                    originals: originals,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: originals.length,
              itemBuilder: (context, index) {
                print(originals[index].guidlineID);
                return Card(
                  child: ListTile(
                    dense: true,
                    title: Text(
                      originals[index].guidlineID.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(originals[index].guidelineText.toString()),
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