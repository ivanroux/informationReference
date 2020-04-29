import 'package:flutter/material.dart';
import 'package:temp/models/user_model.dart';

class DetailPage extends StatelessWidget {
  final User user;

  const DetailPage({
    Key key,
    this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
    );
  }
}
