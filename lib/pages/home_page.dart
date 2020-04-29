import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:temp/models/user_model.dart';
import 'package:temp/pages/detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();

  bool _isLoading = true;

  List<User> _searchResult = [];

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        elevation: 0.0,
      ),
      body: _isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: <Widget>[
                Container(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        leading: Icon(Icons.search),
                        title: TextField(
                          controller: controller,
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                          ),
                          onChanged: onSearchTextChanged,
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.cancel),
                          onPressed: () {
                            controller.clear();
                            onSearchTextChanged('');
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: _searchResult.length != 0 || controller.text.isNotEmpty
                      ? ListView.builder(
                          itemCount: _searchResult.length,
                          itemBuilder: (context, i) {
                            return Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    _searchResult[i].image,
                                  ),
                                ),
                                title: Text(_searchResult[i].name),
                              ),
                              margin: const EdgeInsets.all(0.0),
                            );
                          },
                        )
                      : ListView.builder(
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

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _userDetails.forEach((userDetail) {
      if (userDetail.name.toLowerCase().contains(text))
        _searchResult.add(userDetail);
    });

    setState(() {});
  }
}

final String url =
    'https://script.googleusercontent.com/macros/echo?user_content_key=UOm84kh88fLDcBxfgyk1aSyRqy1ORIp4XyksXyowMHu-vIX70ncxw4xmBAQbGcBsmmDEwWTMWKwLOpQUNykqagN_j7yjXHyIm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnD6uLUp5LUx_GYHsDpqM186qrJOxjNgLYnPb2feoVYuMERx0bBKNW74YzdEizbMkQ9pytj_A4aoE&lib=Mdw3zAyjVJJbKrUzgJvN8PgqwFLz7E46Y';
