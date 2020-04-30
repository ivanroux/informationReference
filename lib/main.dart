import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:temp/models/original_model.dart';
import 'package:temp/models/user_model.dart';
import 'package:temp/pages/home_page.dart';
import 'package:temp/services/connectivity_service.dart';
import 'package:temp/utils/utils.dart';
import 'package:temp/widgets/error_widget..dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();

  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter<User>(UserAdapter());
  Hive.registerAdapter<Original>(OriginalAdapter());

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConnectivityStatus>(
      builder: (context) => ConnectivityService().connectionStatusController,
      child: MaterialApp(
        home: FutureBuilder(
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
        ),
      ),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
