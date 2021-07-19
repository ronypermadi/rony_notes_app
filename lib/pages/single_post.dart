import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:share/share.dart';
import 'package:rony_notes_app/models/posts.dart';
import 'package:rony_notes_app/services/api_services.dart';
import 'package:rony_notes_app/widgets/button_widget.dart';
import 'package:rony_notes_app/widgets/network_image.dart';
import 'package:rony_notes_app/widgets/navdrawer.dart';

class SinglePost extends StatelessWidget {
  final String slug;
  SinglePost({required this.slug, Key? key}) : super(key: key);
  final ApiServices api = ApiServices();
  final imagePath = "https://notes.ronypermadi.com/storage/posts/";
  final primary = Color(0xff212121);
  final secondary = Color(0xffb71c1c);
  final logoHeader =
      'https://notes.ronypermadi.com/assets/front/images/core-img/Logo.png';
  final urlPath = 'https://notes.ronypermadi.com/post/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: primary,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => {
              Navigator.pop(context),
            },
          ),
          title: NetworkImageCache(
            logoHeader,
            fit: BoxFit.cover,
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              SinglePost(slug: slug, key: ValueKey(slug))));
                }),
          ],
          // title: Text('Detail Post'),
        ),
        body: FutureBuilder<Posts>(
          future: api.getSinglePost(slug),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with error message: ${snapshot.error.toString()}"),
              );
            } else if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                            // height: MediaQuery.of(context).size.height * 0.5,
                            width: double.infinity,
                            child: NetworkImageCache(
                              imagePath + snapshot.data!.image,
                              fit: BoxFit.cover,
                            )),
                        BookmarkButton(),
                        Positioned(
                          bottom: 20.0,
                          left: 20.0,
                          right: 20.0,
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.tag_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                snapshot.data!.postCategory,
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 5.0, right: 5.0, bottom: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            snapshot.data!.title,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    color: primary,
                                    size: 12,
                                  ),
                                  SizedBox(width: 3.0),
                                  Text(snapshot.data!.createdAt,
                                      style: TextStyle(fontSize: 14)),
                                  SizedBox(width: 10.0),
                                  Icon(
                                    Icons.account_box,
                                    color: primary,
                                    size: 12,
                                  ),
                                  SizedBox(width: 3.0),
                                  Text(snapshot.data!.author,
                                      style: TextStyle(fontSize: 14)),
                                ],
                              ),
                              Row(
                                children: [
                                  LikeButton(),
                                  IconButton(
                                    alignment: Alignment.centerRight,
                                    icon: Icon(Icons.share_rounded),
                                    onPressed: () {
                                      Share.share(
                                          urlPath + snapshot.data!.slug);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          SizedBox(
                            height: 5.0,
                          ),
                          Html(data: snapshot.data!.description),
                          Divider(),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.tag,
                                size: 13,
                              ),
                              SizedBox(width: 5.0),
                              Text(
                                snapshot.data!.tag,
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                          Divider(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Container(
                    // child: Text("No Post Available"),
                    ),
              );
            }
          },
        ));
  }
}
