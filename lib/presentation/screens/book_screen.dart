import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:reading_app/presentation/widgets/widgets.dart';
import 'package:reading_app/shared/constants/category.dart';
import 'package:reading_app/shared/constants/screen.dart';
import 'package:reading_app/shared/style/color/colors.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
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
                              categoryUrl[2],
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
                              flex: 2,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "Marc Wilhelm Lennartz",
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: mainLightOrange)),
                                    TextSpan(
                                        text: "\nand",
                                        style: TextStyle(
                                            overflow: TextOverflow.clip,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: mainDeepBlue)),
                                    TextSpan(
                                        text: " Susanne Jacob-Freitag",
                                        style: TextStyle(
                                            overflow: TextOverflow.clip,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: mainLightOrange))
                                  ],
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   height: _screen.height * .015,
                            // ),
                            Flexible(
                              flex: 4,
                              child: Text(
                                "New\nArchitecture\nin Wood",
                                style: TextStyle(
                                    height: _screen.height * .0017,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 28),
                              ),
                            ),
                            // SizedBox(
                            //   height: _screen.height * .015,
                            // ),
                            const Expanded(
                              flex: 1,
                              child: Center(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Form and Structures",
                                    style: TextStyle(
                                      fontFamily: "Nunito Sans",
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
                          "4.9",
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
                                    "Your analysis and evaluation should be organized into paragraphs that deal with single aspects of your argument. This arrangement can be challenging when your purpose is to consider the book as a whole, but it can help you differentiate elements of your criticism and pair assertions with evidence more clearly. You do not necessarily need to work chronologically through the book as you discuss it. Given the argument you want to make, you can organize your paragraphs more usefully by themes, methods, or other elements of the book. If you find it useful to include comparisons to other books, keep them brief so that the book under review remains in the spotlight. Avoid excessive quotation and give a specific page reference in parentheses when you do quote. Remember that you can state many of the author’s points in your own words.",
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
