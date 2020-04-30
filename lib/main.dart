import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temp/pages/home_page.dart';
import 'package:temp/services/connectivity_service.dart';
import 'package:temp/utils/utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConnectivityStatus>(
      builder: (context) => ConnectivityService().connectionStatusController,
      child: MaterialApp(
        title: 'Material App',
        home: HomePage(),
      ),
    );
  }
}
