import 'package:flutter/material.dart';
import 'package:temp/models/user_model.dart';
import 'package:temp/pages/detail_page.dart';
import 'package:temp/pages/search_page.dart';
import 'package:temp/services/user_repository.dart';

class NetworkHomeWidget extends StatelessWidget {
  const NetworkHomeWidget({
    Key key,
    @required List<User> userDetails,
    @required UserRepository userRepository,
  })  : _userDetails = userDetails,
        _userRepository = userRepository,
        super(key: key);

  final List<User> _userDetails;
  final UserRepository _userRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: _userDetails.isEmpty
                ? null
                : () {
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
      body: _userRepository.isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: _userDetails.length,
                    itemBuilder: (context, index) {
                      // cacheData(_userDetails[index]);
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
}
