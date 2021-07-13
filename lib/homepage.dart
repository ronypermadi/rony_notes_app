import 'package:flutter/material.dart';
import 'network_image.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);
  static final String path = "lib/homepage.dart";

  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);

  final primary = Color(0xff212121);
  final secondary = Color(0xffb71c1c);
  final logoHeader =
      'https://notes.ronypermadi.com/assets/front/images/core-img/Logo.png';

  final List<Map> dataList = [
    {
      "title": "Rekomendasi Text Editor Untuk Pemrograman",
      "category": "Programming",
      "time": "4 Jul 2021",
      "image":
          "https://notes.ronypermadi.com/storage/posts/1625213519memilih-text-editor-untuk-pemrograman.jpg"
    },
    {
      "title": "Cara Memulai Belajar Pemrograman",
      "category": "Programming",
      "time": "4 Aug 2021",
      "image":
          "https://notes.ronypermadi.com/storage/posts/1625211890cara-memulai-belajar-pemrograman.jpg"
    },
    {
      "title": "Berkenalan dengan Dunia Coding atau Pemrograman",
      "category": "Rony Permadi",
      "time": "4 Dec 2021",
      "image":
          "https://notes.ronypermadi.com/storage/posts/1625211651berkenalan-dengan-dunia-coding-atau-pemrograman.jpg"
    },
    {
      "title": "Rekomendasi Text Editor Untuk Pemrograman",
      "category": "Programming",
      "time": "4 Jul 2021",
      "image":
          "https://notes.ronypermadi.com/storage/posts/1625213519memilih-text-editor-untuk-pemrograman.jpg"
    },
    {
      "title": "Cara Memulai Belajar Pemrograman",
      "category": "Programming",
      "time": "4 Aug 2021",
      "image":
          "https://notes.ronypermadi.com/storage/posts/1625211890cara-memulai-belajar-pemrograman.jpg"
    },
    {
      "title": "Berkenalan dengan Dunia Coding atau Pemrograman",
      "category": "Programming",
      "time": "4 Dec 2021",
      "image":
          "https://notes.ronypermadi.com/storage/posts/1625211651berkenalan-dengan-dunia-coding-atau-pemrograman.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
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
                child: ListView.builder(
                    itemCount: dataList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildList(context, index);
                    }),
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
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(
                      //     Icons.menu,
                      //     color: Colors.white,
                      //   ),
                      // ),
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
              Container(
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
                        child: TextField(
                          // controller: TextEditingController(text: locations[0]),
                          cursorColor: Theme.of(context).primaryColor,
                          style: dropdownMenuItem,
                          decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: TextStyle(
                                  color: Colors.black38, fontSize: 16),
                              prefixIcon: Material(
                                elevation: 0.0,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                child: Icon(Icons.search),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 13)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList(BuildContext context, int index) {
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
          Container(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Row(
              children: <Widget>[
                Container(
                  height: 120,
                  // color: Colors.blue,
                  width: 120,
                  child: NetworkImageCache(
                    dataList[index]['image'],
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 20.0),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(
                        dataList[index]['title'],
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
                                text: dataList[index]['category'],
                                style: TextStyle(fontSize: 10.0)),
                            WidgetSpan(
                              child: const SizedBox(width: 30.0),
                            ),
                            WidgetSpan(
                              child: const SizedBox(width: 10.0),
                            ),
                            TextSpan(
                                text: dataList[index]['time'],
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
          )
        ],
      ),
    );
    // return Container(
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(25),
    //     color: Colors.white,
    //   ),
    //   width: double.infinity,
    //   height: 200,
    //   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       Container(
    //         width: 100,
    //         height: 100,
    //         margin: EdgeInsets.only(right: 15),
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(50),
    //           border: Border.all(width: 3, color: secondary),
    //           image: DecorationImage(
    //               image: NetworkImage(dataList[index]['logoText']),
    //               fit: BoxFit.fill),
    //         ),
    //       ),
    //       Expanded(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: <Widget>[
    //             Text(
    //               dataList[index]['name'],
    //               style: TextStyle(
    //                   color: primary,
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 18),
    //             ),
    //             SizedBox(
    //               height: 6,
    //             ),
    //             Row(
    //               children: <Widget>[
    //                 Icon(
    //                   Icons.location_on,
    //                   color: secondary,
    //                   size: 20,
    //                 ),
    //                 SizedBox(
    //                   width: 5,
    //                 ),
    //                 Text(dataList[index]['location'],
    //                     style: TextStyle(
    //                         color: primary, fontSize: 13, letterSpacing: .3)),
    //               ],
    //             ),
    //             SizedBox(
    //               height: 6,
    //             ),
    //             Row(
    //               children: <Widget>[
    //                 Icon(
    //                   Icons.school,
    //                   color: secondary,
    //                   size: 20,
    //                 ),
    //                 SizedBox(
    //                   width: 5,
    //                 ),
    //                 Text(dataList[index]['type'],
    //                     style: TextStyle(
    //                         color: primary, fontSize: 13, letterSpacing: .3)),
    //               ],
    //             ),
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
