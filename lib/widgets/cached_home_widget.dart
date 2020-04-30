import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:temp/models/user_model.dart';

class CachedHomeWidget extends StatefulWidget {
  const CachedHomeWidget({
    Key key,
    @required this.usersBox,
  }) : super(key: key);

  final Box usersBox;

  @override
  _CachedHomeWidgetState createState() => _CachedHomeWidgetState();
}

class _CachedHomeWidgetState extends State<CachedHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: widget.usersBox.length,
              itemBuilder: (context, index) {
                final cachedUsers = widget.usersBox.getAt(index) as User;
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        cachedUsers.image,
                      ),
                    ),
                    title: Text(cachedUsers.name),
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
