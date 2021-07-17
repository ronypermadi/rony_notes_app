import 'package:flutter/material.dart';
import 'package:rony_notes_app/models/category.dart';
import 'package:rony_notes_app/pages/post_category.dart';
import 'package:rony_notes_app/services/api_services.dart';
import 'package:rony_notes_app/widgets/network_image.dart';
import 'package:rony_notes_app/widgets/navdrawer.dart';
import 'package:rony_notes_app/widgets/search_form.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({Key? key}) : super(key: key);

  final ApiServices api = ApiServices();
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
                  future: api.getCategory(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Category>> snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                            "Something wrong with error message: ${snapshot.error.toString()}"),
                      );
                    } else if (snapshot.hasData) {
                      List<Category> categoryList = snapshot.data!;
                      return _buildListView(categoryList);
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

  Widget _buildListView(List<Category> categoryList) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => PostCategory(
                          name: categoryList[index].name,
                          key: ValueKey(categoryList[index].name))));
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(
                      Icons.tag,
                      color: Colors.white,
                      size: 16,
                    ),
                    Text(categoryList[index].name,
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ]),
              decoration: BoxDecoration(
                  color: primary, borderRadius: BorderRadius.circular(15)),
            ),
          );
        });
  }
}
