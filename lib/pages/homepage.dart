import 'package:flutter/material.dart';
import 'package:rony_notes_app/models/posts.dart';
import 'package:rony_notes_app/pages/single_post.dart';
import 'package:rony_notes_app/services/api_services.dart';
import 'package:rony_notes_app/widgets/network_image.dart';
import 'package:rony_notes_app/widgets/navdrawer.dart';
import 'package:rony_notes_app/widgets/search_form.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final ApiServices api = ApiServices();
  final imagePath = "https://notes.ronypermadi.com/storage/posts/";
  final primary = Color(0xff212121);
  final secondary = Color(0xffb71c1c);
  final logoHeader =
      'https://notes.ronypermadi.com/assets/front/images/core-img/Logo.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 145),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: FutureBuilder(
                  future: api.getPosts(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Posts>> snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                            "Something wrong with error message: ${snapshot.error.toString()}"),
                      );
                    } else if (snapshot.hasData) {
                      List<Posts> postList = snapshot.data!;
                      return _buildListView(postList);
                    } else {
                      return Center(
                        child: Container(
                            // child: Text("Data not found"),
                            ),
                      );
                    }
                  },
                ),
              ),
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Center(
                        child: NetworkImageCache(
                          logoHeader,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SearchForm()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListView(List<Posts> postList) {
    return ListView.builder(
        itemCount: postList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            width: double.infinity,
            height: 120,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => SinglePost(
                                slug: postList[index].slug,
                                key: ValueKey(postList[index].slug))));
                  },
                  child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.30,
                          height: MediaQuery.of(context).size.height,
                          child: NetworkImageCache(
                            imagePath + postList[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 20.0),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Text(
                                postList[index].title,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: secondary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: postList[index].postCategory,
                                        style: TextStyle(fontSize: 10.0)),
                                    WidgetSpan(
                                      child: SizedBox(width: 5.0),
                                    ),
                                    TextSpan(
                                        text: postList[index].createdAt,
                                        style: TextStyle(fontSize: 10.0)),
                                  ],
                                ),
                                style: TextStyle(height: 2.0),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}