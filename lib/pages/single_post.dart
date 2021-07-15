import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:rony_notes_app/models/posts.dart';
import 'package:rony_notes_app/widgets/network_image.dart';
import 'package:rony_notes_app/services/api_services.dart';

class SinglePost extends StatefulWidget {
  final String slug;

  SinglePost({required this.slug, Key? key}) : super(key: key);

  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  final ApiServices api = ApiServices();
  final imagePath = "https://notes.ronypermadi.com/storage/posts/";
  final primary = Color(0xff212121);
  final secondary = Color(0xffb71c1c);
  final logoHeader =
      'https://notes.ronypermadi.com/assets/front/images/core-img/Logo.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: primary,
            centerTitle: true,
            title: NetworkImageCache(
              logoHeader,
              fit: BoxFit.cover,
            )
            // title: Text('Detail Post'),
            ),
        body: FutureBuilder<Posts>(
          future: api.getSinglePost(widget.slug),
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
                            children: <Widget>[
                              Icon(
                                Icons.timer,
                                color: primary,
                                size: 10,
                              ),
                              Expanded(
                                child: Text(snapshot.data!.createdAt),
                              ),
                              IconButton(
                                icon: Icon(Icons.share, size: 10),
                                onPressed: () {},
                              )
                            ],
                          ),
                          Divider(),
                          SizedBox(
                            height: 5.0,
                          ),
                          Html(data: snapshot.data!.description),
                          // Text(
                          //   snapshot.data!.description,
                          //   textAlign: TextAlign.justify,
                          // )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Container(
                    // child: Text("Data not found"),
                    ),
              );
            }
          },
        ));
  }
}
