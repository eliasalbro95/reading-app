import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ant_design.dart';
import 'package:reading_app/logic/cubits/reading_cubit.dart';
import 'package:reading_app/presentation/widgets/widgets.dart';
import 'package:reading_app/shared/constants/api_fetch.dart';
import 'package:reading_app/shared/constants/category.dart';
import 'package:reading_app/shared/constants/screen.dart';
import 'package:reading_app/shared/style/color/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ReadingCubit _readingCubit = ReadingCubit.get(context);
    final user = FirebaseAuth.instance.currentUser!;
    ResponsiveScreen _screen = ResponsiveScreen(context);
    return BlocConsumer<ReadingCubit, ReadingState>(
      listener: (context, state) {
        if (state is ReadingChangeCategoryState) {
          _readingCubit.getCategory(category: category[selectedCategoryNumber]);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: appBarDefault(screen: _screen, context: context),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TabBar(
              //   padding: EdgeInsets.zero,
              //   indicator: BoxDecoration(
              //     border: Border(
              //       bottom: BorderSide(
              //           color: mainWhite,
              //           width: _screen.width * .005), // for right side
              //     ),
              //   ),
              //   tabs: const [
              //     Tab(
              //       text: "Books",
              //     ),
              //     Tab(
              //       text: "Audio",
              //     ),
              //     Tab(
              //       text: "Blog",
              //     ),
              //   ],
              // ),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    height: _screen.height * .05,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                _readingCubit.changeCategory(index,
                                    categoryHomePage[index].toLowerCase());
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 17, vertical: 7),
                                child: Center(
                                  child: Text(
                                    categoryHomePage[index],
                                    style: TextStyle(
                                        fontSize: 18, color: mainWhite),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: selectedCategoryNumber == index
                                        ? mainLightOrange
                                        : mainDeepBlue,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border(
                                        bottom: BorderSide(
                                          color: mainWhite,
                                          style: BorderStyle.solid,
                                        ),
                                        top: BorderSide(
                                          color: mainWhite,
                                          style: BorderStyle.solid,
                                        ),
                                        right: BorderSide(
                                          color: mainWhite,
                                          style: BorderStyle.solid,
                                        ),
                                        left: BorderSide(
                                          color: mainWhite,
                                          style: BorderStyle.solid,
                                        ))),
                              ),
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              width: _screen.width * 0.03,
                            ),
                        itemCount: category.length),
                  )),
              SizedBox(
                height: _screen.height * .015,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Your daily pick",
                  style: TextStyle(fontSize: 24, color: mainWhite),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView.builder(
                    itemCount: dataFetched.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            childAspectRatio: 2 / 3,
                            mainAxisSpacing: 20),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        bookScreenArgs = [
                          dataFetched[index]
                              .imageLinks["thumbnail"]
                              .toString(),
                          dataFetched[index].authors,
                          dataFetched[index].title,
                          dataFetched[index].subtitle,
                          dataFetched[index].averageRating,
                          dataFetched[index].description,
                        ];
                        Navigator.of(context).pushNamed("/book");
                      },
                      child: Container(
                        height: _screen.height * .55,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Center(
                                child: SizedBox(
                                  height: _screen.height * .25,
                                  child: Image.network(
                                    dataFetched[index]
                                        .imageLinks["thumbnail"]
                                        .toString(),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                      dataFetched[index].title,
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: mainWhite,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  // Text(
                                  //   dataFetched[index].categories[0],
                                  //   style: const TextStyle(
                                  //       overflow: TextOverflow.ellipsis,
                                  //       color: Colors.grey,
                                  //       fontSize: 12,
                                  //       fontWeight: FontWeight.w600),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: mainDeepBlue,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 1,
            type: BottomNavigationBarType.fixed,
            backgroundColor: mainDeepBlue,
            selectedItemColor: mainWhite,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                  icon: Iconify(
                    AntDesign.home_outlined,
                    color: mainWhite,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: InkWell(
                      onTap: () {
                        // _readingCubit.emailSingIn(email: "eliasalbro96@gmail.com",password: "elias1234");
                        Navigator.of(context).pushNamed("/profile");
                      },
                      child: CircleAvatar(
                          radius: _screen.width * .030,
                          backgroundColor: mainDeepBlue,
                          backgroundImage: NetworkImage(
                              user.photoURL!))),
                  label: "Profile"),
            ],
          ),

        );
      },
    );
  }
}
