import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:reading_app/presentation/widgets/widgets.dart';
import 'package:reading_app/shared/constants/screen.dart';
import 'package:reading_app/shared/style/color/colors.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key, required this.imageUrl, required this.authors, required this.title, required this.subtitle, required this.rate, required this.description}) : super(key: key);
  final String imageUrl;
  final List<String> authors;
  final String title;
  final String subtitle;
  final double rate;
  final String description;
  @override
  State<BookScreen> createState() => _BookScreenState(imageUrl,authors,title,subtitle,rate,description);
}

class _BookScreenState extends State<BookScreen> {
  final String imageUrl1;
  final List<String> authors1;
  final String title1;
  final String subtitle1;
  final double rate1;
  final String description1;

  _BookScreenState(this.imageUrl1, this.authors1, this.title1, this.subtitle1, this.rate1, this.description1,
      );


  @override
  Widget build(BuildContext context) {
    ResponsiveScreen _screen = ResponsiveScreen(context);
    return Scaffold(
      appBar: appBarProfile(screen: _screen, context: context),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: mainWhite,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: _screen.height * .02,
                    horizontal: _screen.width * .05),
                child: Row(
                  children: [
                    Container(
                      width: _screen.width * .40,
                      height: _screen.height * .30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              imageUrl1,
                            ),
                          )),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: _screen.width * 0.03),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: authors1[0],
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: mainLightOrange)),
                                  ],
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   height: _screen.height * .015,
                            // ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                title1,
                                style: TextStyle(
                                    height: _screen.height * .0015,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22),
                              ),
                            ),
                            // SizedBox(
                            //   height: _screen.height * .015,
                            // ),
                            //  Expanded(
                            //   flex: 1,
                            //   child: Center(
                            //     child: Align(
                            //       alignment: Alignment.centerLeft,
                            //       child: Text(
                            //         subtitle1,
                            //         style: TextStyle(
                            //           fontFamily: "Nunito Sans",
                            //           fontSize: 14,
                            //           color: Colors.grey,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Iconify(Ph.minus_circle,
                            color: Colors.grey, size: _screen.width * .1),
                        const Text(
                          "Hide",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        )
                      ],
                    ),
                    // SizedBox(width: _screen.width*.02,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Iconify(Ic.outline_headset,
                            color: Colors.grey, size: _screen.width * .1),
                        const Text(
                          "Listen",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Iconify(Ic.bookmark_border,
                            color: Colors.grey, size: _screen.width * .1),
                        const Text(
                          "Save",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        )
                      ],
                    ),
                  ],
                ),
              )),
          const Divider(
            height: 0.5,
            indent: 20,
            endIndent: 20,
            color: Colors.grey,
          ),
          Expanded(
              flex: 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "$rate1",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: mainWhite),
                        ),
                        SizedBox(
                          width: _screen.width * .007,
                        ),
                        Iconify(
                          Ic.baseline_star,
                          color: Colors.amberAccent,
                          size: _screen.width * .05,
                        ),
                        SizedBox(
                          width: _screen.width * .02,
                        ),
                        Text(
                          "See reviews(11)",
                          style: TextStyle(
                              color: mainWhite,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        Iconify(
                          Ic.round_keyboard_arrow_right,
                          color: mainWhite,
                          size: _screen.width * .05,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Container(
                          height: _screen.height * 0.35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: mainLightPurple.withOpacity(0.1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "OVERVIEW",
                                  style: TextStyle(
                                      color: mainWhite,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: _screen.height * .02,
                                ),
                                Expanded(
                                    child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Text(
                                    description1,
                                          style: TextStyle(
                                      fontSize: 16,
                                      color: mainWhite,
                                      overflow: TextOverflow.clip,
                                    ),
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
      floatingActionButton: SizedBox(child: signInUpButton(onPressed: (){}, text: "START READING", color: mainBlue, textColor: mainWhite),
      width: _screen.width*.6
        ,height: _screen.height*.06,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
