import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:temp/pages/home_page.dart';
import 'package:temp/widgets/error_widget.dart';

class HomeBuilderWidget extends StatelessWidget {
  const HomeBuilderWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox('user'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError)
            return MyErrorWidget(
              errorMessage: snapshot.error.toString(),
            );
          else
            return HomePage();
        } else
          return Scaffold();
      },
    );
  }
}
