import 'package:flutter/material.dart';
import 'package:reading_app/presentation/widgets/widgets.dart';
import 'package:reading_app/shared/constants/category.dart';
import 'package:reading_app/shared/constants/screen.dart';
import 'package:reading_app/shared/style/color/colors.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    ResponsiveScreen _screen = ResponsiveScreen(context);
    return Scaffold(
      appBar: appBarDefault(screen: _screen, context: context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: mainDeepBlue,
              pinned: true,
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Pick your interests",
                  style: TextStyle(
                      color: mainWhite,
                      fontSize: 24,
                      fontFamily: "Nunito Sans"),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Column(
                        children: [
                          ListTile(
                            leading: Container(
                              height: _screen.height * .06,
                              width: _screen.width * .12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      categoryUrl[index],
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            title: Text(
                              category[index],
                              style: TextStyle(color: mainWhite, fontSize: 18),
                            ),
                            trailing: Text(
                              "Folow",
                              style: TextStyle(
                                  color: mainWhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Divider(
                            thickness: 0.8,
                            height: _screen.height * 0.02,
                            color: Colors.grey,
                            indent: _screen.width * .2,
                            endIndent: _screen.width * .02,
                          ),
                          // SizedBox(
                          //   height: _screen.height * 0.007,
                          // )
                        ],
                      ),
                  childCount: category.length),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: _screen.height * 0.07,
        width: _screen.width * .5,
        child: signInUpButton(
            onPressed: () {},
            text: "Continue",
            color: mainCyan,
            textColor: mainWhite),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
