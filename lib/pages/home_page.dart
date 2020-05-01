import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:temp/models/user_model.dart';
import 'package:temp/services/user_repository.dart';

import 'package:temp/utils/utils.dart';
import 'package:temp/widgets/cached_home_widget.dart';
import 'package:temp/widgets/network_home_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserRepository _userRepository = UserRepository();

  List<User> _userDetails = [];

  final usersBox = Hive.box('user');

  getUsers() async {
    var users = await _userRepository.getDetails();
    setState(() {
      for (Map user in users) {
        _userDetails.add(User.fromJson(user));
      }
    });
  }

  void cacheUsers() {
    _userDetails.map((user) => usersBox.add(user)).toList();
  }

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Get our connection status from the provider
    var connectionStatus = Provider.of<ConnectivityStatus>(context);

    if (connectionStatus == ConnectivityStatus.WiFi ||
        connectionStatus == ConnectivityStatus.Cellular) {
      if (usersBox.isEmpty) {
        cacheUsers();
      }
      return NetworkHomeWidget(
        userDetails: _userDetails,
        userRepository: _userRepository,
      );
    }
    return CachedHomeWidget(usersBox: usersBox);
  }
}