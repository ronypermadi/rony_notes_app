import 'package:flutter/material.dart';
import 'package:rony_notes_app/models/posts.dart';
import 'package:rony_notes_app/pages/single_post.dart';
import 'package:rony_notes_app/services/api_services.dart';
import 'package:rony_notes_app/widgets/network_image.dart';
import 'package:rony_notes_app/widgets/navdrawer.dart';
import 'package:rony_notes_app/widgets/search_form.dart';

class SearchPost extends StatelessWidget {
  final String search;
  SearchPost({required this.search, Key? key}) : super(key: key);
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
                  future: api.getSearchPost(search),
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
                            // child: Text("No Post Available"),
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
            margin: EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (BuildContext context) => SinglePost(
                  //             slug: postList[index].slug,
                  //             key: ValueKey(postList[index].slug))));
                },
                child: Container(
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            NetworkImageCache(
                              imagePath + postList[index].image,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              bottom: 0.0,
                              left: 8.0,
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                color: secondary,
                                child: Text(postList[index].createdAt,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                postList[index].title,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.tag,
                                        color: primary,
                                        size: 12,
                                      ),
                                      SizedBox(width: 1.5),
                                      Text(postList[index].postCategory,
                                          style: TextStyle(fontSize: 12)),
                                      SizedBox(width: 5.0),
                                      Icon(
                                        Icons.account_box,
                                        color: primary,
                                        size: 12,
                                      ),
                                      SizedBox(width: 1.5),
                                      Text(postList[index].author,
                                          style: TextStyle(fontSize: 12)),
                                    ],
                                  ),
                                  ElevatedButton(
                                    child: Row(children: <Widget>[
                                      Text("Read More ",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold)),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: 10,
                                      )
                                    ]),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  SinglePost(
                                                      slug:
                                                          postList[index].slug,
                                                      key: ValueKey(
                                                          postList[index]
                                                              .slug))));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: primary,
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(5.0),
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
