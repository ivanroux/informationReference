import 'package:flutter/material.dart';
import 'package:temp/Model/networkModel.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:connectivity/connectivity.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Information App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _connectionStatus = "Unknown";
  Connectivity connectivity;
  StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    super.initState();
    connectivity = new Connectivity();
    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _connectionStatus = result.toString();
      print(_connectionStatus);
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        setState(() {});
      }else{
        //DefaultCacheManager().getFile(url)
      }
    });
  }  

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }  
  
  Future<Albums> getData() async {
    var url =
        "https://script.googleusercontent.com/macros/echo?user_content_key=ieQDd6GdKQ-zSJfBwzbn0551mieSVfEK2dWxW0nMQ9dmvvqfDF-2p6o7h3M0xfISllpv9eAymCAu9Tyiw4fQzh6sYr5CI8F5m5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnD6uLUp5LUx_GYHsDpqM186qrJOxjNgLYnPb2feoVYuMERx0bBKNW74YzdEizbMkQ9pytj_A4aoE&lib=Mdw3zAyjVJJbKrUzgJvN8PgqwFLz7E46Y";
    
    var response = await http.get(url);
    if (response.statusCode == 200) {
      //var result = jsonDecode(response.body); 
      final result = jsonDecode(response.body);
      return result;
    } else {
      print("Request failed with status: ${response.statusCode}.");

      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var futureBuilder = new FutureBuilder<Albums>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return new Text('loading...');
          default:
            if (snapshot.hasError) return new Text('Error: ${snapshot.error}');

            return createListView(context, snapshot);
        }
      },
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home Page"),
      ),
      body: futureBuilder,
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    return new ListView.builder(
      itemCount: snapshot.data.user.length,
      itemBuilder: (BuildContext context, int index) {
        var detail = snapshot.data.user[Original][index];
        return Container(
          padding: const EdgeInsets.all(1.0),
          child: Card(
            clipBehavior: Clip.antiAlias, //optional
            child: InkWell(
              //TODO add the second screen shortcut here
              onTap: (){
                // Navigate to second screen with data
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new DetailScreen(original: new Original(detail.guidlineName, detail.guidelinePicture, detail.guidelineText))));
              },
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Text(
                        snapshot.data.user[index].name,
                        style: TextStyle(
                          backgroundColor: Colors.white30,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  snapshot.data.user[index].image == ArgumentError.notNull()
                      ? null
                      : Image.network(
                          snapshot.data.user[index].image,
                          fit: BoxFit.cover,
                        ),
                  //new RaisedButton(child: Text("Make a note"), onPressed: () {})
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// Screen class for second screen

class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Person data
  final Original original;

  // In the constructor, require a Person
  DetailScreen({Key key, @required this.original}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(snapshot.data.user[index].name),
      ),
      body: new Container(
          padding: const EdgeInsets.all(1.0),
          child: Card(
            clipBehavior: Clip.antiAlias, //optional
            child: InkWell(
              //TODO add the third screen shortcut here
              onTap: (){
                // Navigate to third screen with data
              },
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Text(
                        original.guidlineName,
                        style: TextStyle(
                          backgroundColor: Colors.white30,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Text(
                       original.guidelineText,
                        style: TextStyle(
                          backgroundColor: Colors.white30,
                          color: Colors.black,
                          //fontWeight: FontWeight.w900,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  original.guidelinePicture == ArgumentError.notNull()
                      ? null
                      : Image.network(
                          original.guidelinePicture,
                          fit: BoxFit.cover,
                        ),
                  //new RaisedButton(child: Text("Make a note"), onPressed: () {})
                ],
              ),
            ),
          ),
        )
    );
  }
}
