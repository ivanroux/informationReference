import 'package:flutter/material.dart';
import 'package:temp/services/connectivity_service.dart';
import 'package:temp/utils/utils.dart';
import 'package:provider/provider.dart';

class ConnectivityProviderWidget extends StatelessWidget {
  final Widget child;

  /// Provide Connectivity Status to the App
  const ConnectivityProviderWidget({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConnectivityStatus>(
      builder: (context) => ConnectivityService().connectionStatusController,
      child: child,
    );
  }
}
