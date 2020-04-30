import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:temp/models/user_model.dart';
import 'package:temp/pages/detail_page.dart';
import 'package:temp/pages/search_page.dart';
import 'package:temp/utils/utils.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;

  List<User> _userDetails = [];

  // Get json result and convert it to model. Then add
  Future<Null> getUserDetails() async {
    final response = await http.get(url);
    final responseJson = json.decode(response.body);

    if (responseJson != null) {
      _isLoading = false;
      var users = responseJson["user"];
      setState(() {
        for (Map user in users) {
          _userDetails.add(User.fromJson(user));
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();

    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    // Get our connection status from the provider
    var connectionStatus = Provider.of<ConnectivityStatus>(context);

    if (connectionStatus == ConnectivityStatus.WiFi ||
        connectionStatus == ConnectivityStatus.Cellular) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(
                      users: _userDetails,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        body: _isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: _userDetails.length,
                      itemBuilder: (context, index) {
                        print(_userDetails[index].image);
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                _userDetails[index].image,
                              ),
                            ),
                            title: Text(_userDetails[index].name),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    user: _userDetails[index],
                                  ),
                                ),
                              );
                            },
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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LinearProgressIndicator(),
          Text("No network availaible, please connect to a network"),
        ],
      ),
    );
  }
}

final String url =
    'https://script.googleusercontent.com/macros/echo?user_content_key=UOm84kh88fLDcBxfgyk1aSyRqy1ORIp4XyksXyowMHu-vIX70ncxw4xmBAQbGcBsmmDEwWTMWKwLOpQUNykqagN_j7yjXHyIm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnD6uLUp5LUx_GYHsDpqM186qrJOxjNgLYnPb2feoVYuMERx0bBKNW74YzdEizbMkQ9pytj_A4aoE&lib=Mdw3zAyjVJJbKrUzgJvN8PgqwFLz7E46Y';
