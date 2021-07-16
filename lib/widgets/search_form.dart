import 'package:flutter/material.dart';
import 'package:rony_notes_app/pages/search_post.dart';

class SearchForm extends StatelessWidget {
  // final TextStyle dropdownMenuItem =
  //     TextStyle(color: Colors.black, fontSize: 18);
  final mySearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 110,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextFormField(
                controller: mySearch,
                textInputAction: TextInputAction.search,
                onFieldSubmitted: (mySearch) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchPost(
                            search: this.mySearch.text,
                            key: ValueKey(this.mySearch.text))),
                  );
                },
                cursorColor: Theme.of(context).primaryColor,
                // style: dropdownMenuItem,
                decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.black38, fontSize: 16),
                    border: InputBorder.none,
                    prefixIcon: Material(
                      elevation: 0.0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(Icons.search),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
