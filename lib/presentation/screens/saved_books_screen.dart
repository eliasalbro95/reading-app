import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ant_design.dart';
import 'package:iconify_flutter/icons/healthicons.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:reading_app/presentation/widgets/widgets.dart';
import 'package:reading_app/shared/constants/category.dart';
import 'package:reading_app/shared/constants/screen.dart';
import 'package:reading_app/shared/style/color/colors.dart';

class SavedBooksScreen extends StatefulWidget {
  const SavedBooksScreen({Key? key}) : super(key: key);

  @override
  State<SavedBooksScreen> createState() => _SavedBooksScreenState();
}

class _SavedBooksScreenState extends State<SavedBooksScreen> {
  @override
  Widget build(BuildContext context) {
    ResponsiveScreen _screen = ResponsiveScreen(context);
    return Scaffold(
      backgroundColor: mainWhite,
      appBar: appBarProfile(screen: _screen, context: context),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: Text(
                "Saved",
                style: TextStyle(
                    fontSize: 20,
                    color: mainDeepBlue,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: _screen.height * .02),
            // Expanded(
            //   flex: 4,
            //   child: GridView.builder(
            //     itemCount: categoryUrl.length,
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2,
            //         crossAxisSpacing: 20,
            //         childAspectRatio: 2 / 3,
            //         mainAxisSpacing: 20),
            //     itemBuilder: (context, index) => Container(
            //       height: _screen.height * .45,
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Expanded(
            //             flex: 4,
            //             child: Center(
            //               child: SizedBox(
            //                 height: _screen.height * .25,
            //                 child: Image.network(
            //                   categoryUrl[index],
            //                   fit: BoxFit.cover,
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //       decoration: BoxDecoration(
            //         color: mainDeepBlue,
            //       ),
            //     ),
            //   ),
            // ),
            Expanded(
              flex: 4,
              child: GridView.builder(
                itemCount: 3,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    childAspectRatio: 2 / 3,
                    mainAxisSpacing: 20),
                itemBuilder: (context, index) => Container(
                  height: _screen.height * .45,
                  // child: Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Expanded(
                  //       flex: 4,
                  //       child: Center(
                  //         child: SizedBox(
                  //           height: _screen.height * .25,
                  //           child: Image.network(
                  //             categoryUrl[index],
                  //             fit: BoxFit.cover,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: mainWhite,
                      border: Border.all(color: mainDeepBlue)),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        type: BottomNavigationBarType.fixed,
        backgroundColor: mainWhite,
        selectedItemColor: mainDeepBlue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Iconify(Ph.stack_thin, color: Colors.grey), label: "Stack"),
          BottomNavigationBarItem(
              icon: Iconify(
                AntDesign.home_outlined,
                color: Colors.grey,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Iconify(
                Healthicons.ui_user_profile_outline,
                color: Colors.grey,
              ),
              label: "Profile"),
        ],
      ),
    );
  }
}
