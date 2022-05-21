import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ant_design.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/mdi.dart';
// import 'package:rate_my_app/rate_my_app.dart';
import 'package:reading_app/logic/cubits/reading_cubit.dart';
import 'package:reading_app/shared/constants/screen.dart';
import 'package:reading_app/shared/style/color/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    ResponsiveScreen _screen = ResponsiveScreen(context);
    ReadingCubit _readingCubit = ReadingCubit.get(context);
    return BlocConsumer<ReadingCubit, ReadingState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: mainWhite,
          appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: mainWhite,
              elevation: 0,
              titleSpacing: _screen.width * .02,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: _screen.width * .02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Iconify(
                        Ic.twotone_keyboard_arrow_left,
                        color: mainDeepBlue,
                        size: 40,
                      ),
                    ),
                    Text(
                      "back",
                      style: TextStyle(
                          color: mainDeepBlue, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              actions: [
                PopupMenuButton(
                    icon: Iconify(Mdi.dots_horizontal, color: mainDeepBlue),
                    color: mainWhite,
                    onSelected: (item) {
                      switch (item) {
                        case 'Log out':
                          _readingCubit.googleLogout();
                          Navigator.of(context).pushNamed("/");
                          break;
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return _myMenuItems.map((String choice) {
                        return PopupMenuItem<String>(
                          child: Text(choice),
                          value: choice,
                        );
                      }).toList();
                    })
              ]
              // InkWell(
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: _screen.width * .02),
              //     child: Iconify(Mdi.dots_horizontal, color: mainDeepBlue),
              //   ),
              //   onTap: (){
              //     _readingCubit.threeDotsMenu(context);
              //   },
              // ),

              ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: _screen.height * .03,
                      horizontal: _screen.width * .06),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(
                          user.photoURL!,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: _screen.width * .01),
                                    child: Text(
                                      user.displayName!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: _screen.width * .02,
                                  ),
                                  Icon(
                                    Icons.edit,
                                    color: mainCyan,
                                    size: 20,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: _screen.height * .003,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: _screen.width * .01),
                                child: Text(
                                  user.email!,
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ),
                              SizedBox(
                                height: _screen.height * .003,
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   children:[
                              //     Icon(
                              //       Icons.location_on_rounded,
                              //       color: Colors.grey,
                              //       size: 20,
                              //     ),
                              //     // Text(
                              //     //   "",
                              //     //   style: TextStyle(
                              //     //       fontSize: 12, color: Colors.grey),
                              //     // ),
                              //   ],
                              // )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: _screen.width * .03),
                  child: Column(
                    children: [
                      // ListTile(
                      //   title: const Text(
                      //     "Customize your intrests",
                      //     style: TextStyle(
                      //         fontSize: 18, fontWeight: FontWeight.w300),
                      //   ),
                      //   trailing: Iconify(
                      //     Ic.twotone_keyboard_arrow_right,
                      //     color: mainDeepBlue,
                      //     size: 25,
                      //   ),
                      //   onTap: () {
                      //     Navigator.of(context).pushNamed("/category");
                      //   },
                      // ),
                      // const ListTile(
                      //   leading: Iconify(
                      //     Ic.outline_history,
                      //     size: 25,
                      //   ),
                      //   title: Text(
                      //     "History",
                      //     style: TextStyle(
                      //         fontSize: 18, fontWeight: FontWeight.w300),
                      //   ),
                      // ),
                      // ListTile(
                      //   leading: const Iconify(
                      //     Ic.favorite_border,
                      //     size: 25,
                      //   ),
                      //   title: const Text(
                      //     "Likes",
                      //     style: TextStyle(
                      //         fontSize: 18, fontWeight: FontWeight.w300),
                      //   ),
                      //   trailing: Padding(
                      //     padding: EdgeInsets.symmetric(
                      //         horizontal: _screen.width * .02),
                      //     child: const Text("3"),
                      //   ),
                      //   onTap: () {
                      //     Navigator.of(context).pushNamed("/liked");
                      //   },
                      // ),
                      // ListTile(
                      //   leading: const Iconify(
                      //     Ic.bookmark_border,
                      //     size: 25,
                      //   ),
                      //   title: const Text(
                      //     "Saved",
                      //     style: TextStyle(
                      //         fontSize: 18, fontWeight: FontWeight.w300),
                      //   ),
                      //   trailing: Padding(
                      //     padding: EdgeInsets.symmetric(
                      //         horizontal: _screen.width * .02),
                      //     child: const Text("7"),
                      //   ),
                      //   onTap: () {
                      //     Navigator.of(context).pushNamed("/saved");
                      //   },
                      // ),
                      // ListTile(
                      //   leading: const Iconify(
                      //     Ic.favorite_border,
                      //     size: 25,
                      //   ),
                      //   title: const Text(
                      //     "Likes",
                      //     style: TextStyle(
                      //         fontSize: 18, fontWeight: FontWeight.w300),
                      //   ),
                      //   trailing: Padding(
                      //     padding: EdgeInsets.symmetric(
                      //         horizontal: _screen.width * .02),
                      //     child: const Text("3"),
                      //   ),
                      // ),
                      ListTile(
                        onTap: () async {
                          // RateMyApp rateMyApp = RateMyApp();
                          // return await rateMyApp.showStarRateDialog(context);
                        },
                        leading: const Iconify(
                          Ic.baseline_star_outline,
                          size: 25,
                        ),
                        title: const Text(
                          "Rate us",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300),
                        ),
                      ),
                      const ListTile(
                        leading: Iconify(
                          Ic.outline_info,
                          size: 25,
                        ),
                        title: Text(
                          "About",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 1,
            type: BottomNavigationBarType.fixed,
            backgroundColor: mainWhite,
            elevation: 4,
            selectedItemColor: mainDeepBlue,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                  icon: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("/home");
                    },
                    child: Iconify(
                      AntDesign.home_outlined,
                      color: mainDeepBlue,
                    ),
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: CircleAvatar(
                      radius: _screen.width * .030,
                      backgroundColor: mainDeepBlue,
                      backgroundImage: NetworkImage(user.photoURL!)),
                  label: "Profile"),
            ],
          ),
        );
      },
    );
  }

  final _myMenuItems = <String>[
    'Log out',
  ];

}
