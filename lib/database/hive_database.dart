import 'package:hive/hive.dart';
import 'package:temp/models/original_model.dart';
import 'package:temp/models/user_model.dart';

import 'package:path_provider/path_provider.dart' as path_provider;

/// Initialization of Hive Database
initializeHive() async {
  // Path to app directory in local device
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();

// Initializing hive to a specific path in device
  Hive
    ..init(appDocumentDirectory.path)
    ..registerAdapter<User>(UserAdapter())
    ..registerAdapter<Original>(OriginalAdapter());
}
