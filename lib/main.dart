import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:temp/database/hive_database.dart';
import 'package:temp/widgets/connectivity_provider_widget.dart';
import 'package:temp/widgets/home_builder_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeHive();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ConnectivityProviderWidget(
      child: MaterialApp(
        home: HomeBuilderWidget(),
      ),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
