import 'package:flutter/material.dart';

class MyErrorWidget extends StatelessWidget {
  final String errorMessage;

  const MyErrorWidget({
    Key key,
    @required this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          errorMessage,
        ),
      ),
    );
  }
}
