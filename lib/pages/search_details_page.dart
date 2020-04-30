import 'package:flutter/material.dart';
import 'package:temp/models/original_model.dart';

class SearchDetailsPage extends StatefulWidget {
  final List<Original> originals;

  SearchDetailsPage({Key key, this.originals}) : super(key: key);

  @override
  _SearchDetailsPageState createState() => _SearchDetailsPageState();
}

class _SearchDetailsPageState extends State<SearchDetailsPage> {
  TextEditingController controller = TextEditingController();

  List<Original> _searchResult = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                            title: Text(_searchResult[i].guidelineText),
                          ),
                          margin: const EdgeInsets.all(0.0),
                        );
                      },
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Start Searching..."),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    widget.originals.forEach((original) {
      if (original.guidelineText.toLowerCase().contains(
            text.toLowerCase(),
          )) _searchResult.add(original);
    });

    setState(() {});
  }
}
