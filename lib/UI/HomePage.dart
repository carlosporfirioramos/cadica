import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cadica/Model/Method.dart';
import 'package:cadica/UI/About.dart';
import 'package:cadica/UI/FeatureProject.dart';
import 'package:cadica/UI/Work.dart';
import 'package:cadica/Widget/AppBarTitle.dart';
import 'package:cadica/Widget/CustomText.dart';
import 'package:cadica/Widget/MainTiitle.dart';
import 'package:cadica/Widget/OSImages.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../contants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Method method = Method();
  AutoScrollController? _autoScrollController;
  final scrollDirection = Axis.vertical;

  bool isExpaned = true;

  bool get _isAppBarExpanded {
    return _autoScrollController!.hasClients &&
        _autoScrollController!.offset > (160 - kToolbarHeight);
  }

  @override
  void initState() {
    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection,
    )..addListener(
        () => _isAppBarExpanded
            ? isExpaned != false
                ? setState(
                    () {
                      isExpaned = false;
                      print('setState is called');
                    },
                  )
                : {}
            : isExpaned != true
                ? setState(() {
                    print('setState is called');
                    isExpaned = true;
                  })
                : {},
      );
    super.initState();
  }

  Future _scrollToIndex(int index) async {
    await _autoScrollController!.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    _autoScrollController!.highlight(index);
  }

  Widget _wrapScrollTag({required int index, required Widget child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollController!,
      index: index,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          primary: true,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //Mavigation Bar
              Container(
                height: size.height * 0.14,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      // IconButton(
                      //     icon: Icon(
                      //       Icons.change_history,
                      //       size: 32.0,
                      //       color: Color(0xff64FFDA),
                      //     ),
                      //     onPressed: () {}),
                      Spacer(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DefaultTabController(
                            length: 4,
                            child: TabBar(
                              unselectedLabelColor: Colors.green,
                              enableFeedback: true,
                              // indicatorSize: TabBarIndicatorSize.tab,
                              // labelColor: Colors.amber,
                              indicatorColor: Colors.transparent,
                              onTap: (index) async {
                                _scrollToIndex(index);
                              },
                              tabs: [
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Principais lojas',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Quem usa o Cadica?',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Login',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Cadastrar',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 16.0),
                      //   child: Card(
                      //     elevation: 4.0,
                      //     color: Color(0xff64FFDA),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(6.0),
                      //     ),
                      //     child: Container(
                      //       margin: EdgeInsets.all(0.85),
                      //       height: size.height * 0.07,
                      //       width: size.height * 0.20,
                      //       alignment: Alignment.center,
                      //       decoration: BoxDecoration(
                      //         color: Color(0xff0A192F),
                      //         borderRadius: BorderRadius.circular(6.0),
                      //       ),
                      //       child: FlatButton(
                      //         hoverColor: Color(0xFF3E0449),
                      //         onPressed: () {
                      //           method.launchURL(
                      //               "https://drive.google.com/file/d/1yHLcrN5pCUGIeT8SrwC2L95Lv0MVbJpx/view?usp=sharing");
                      //         },
                      //         child: Padding(
                      //           padding: const EdgeInsets.symmetric(
                      //             horizontal: 8.0,
                      //           ),
                      //           child: Text(
                      //             "Resume",
                      //             style: TextStyle(
                      //               color: Color(0xff64FFDA),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),

              Row(
                children: [
                  //Social Icon
                  // Container(
                  //   width: size.width * 0.09,
                  //   height: size.height - 82,
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: [
                  //       IconButton(
                  //           icon: FaIcon(FontAwesomeIcons.github),
                  //           color: Color(0xffffA8B2D1),
                  //           iconSize: 16.0,
                  //           onPressed: () {
                  //             method.launchURL("https://github.com/champ96k");
                  //           }),
                  //       IconButton(
                  //           icon: FaIcon(FontAwesomeIcons.twitter),
                  //           color: Color(0xffffA8B2D1),
                  //           iconSize: 16.0,
                  //           onPressed: () {
                  //             method.launchURL("https://twitter.com/champ_96k");
                  //           }),
                  //       IconButton(
                  //         icon: FaIcon(FontAwesomeIcons.linkedin),
                  //         color: Color(0xffffA8B2D1),
                  //         onPressed: () {
                  //           method.launchURL(
                  //               "https://www.linkedin.com/in/tushar-nikam-a29a97131/");
                  //         },
                  //         iconSize: 16.0,
                  //       ),
                  //       IconButton(
                  //           icon: Icon(Icons.call),
                  //           color: Color(0xffffA8B2D1),
                  //           iconSize: 16.0,
                  //           onPressed: () {
                  //             method.launchCaller();
                  //           }),
                  //       IconButton(
                  //           icon: Icon(Icons.mail),
                  //           color: Color(0xffffA8B2D1),
                  //           iconSize: 16.0,
                  //           onPressed: () {
                  //             method.launchEmail();
                  //           }),
                  //       Padding(
                  //         padding: const EdgeInsets.only(top: 16.0),
                  //         child: Container(
                  //           height: size.height * 0.20,
                  //           width: 2,
                  //           color: Colors.grey.withOpacity(0.4),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Expanded(
                    child: Container(
                      height: size.height - 82,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomScrollView(
                          controller: _autoScrollController,
                          slivers: <Widget>[
                            SliverList(
                                delegate: SliverChildListDelegate([
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // SizedBox(
                                  //   height: size.height * .06,
                                  // ),
                                  // CustomText(
                                  //   text: "Hi, my name is",
                                  //   textsize: 16.0,
                                  //   color: Color(0xff41FBDA),
                                  //   letterSpacing: 3.0,
                                  // ),
                                  // SizedBox(
                                  //   height: 6.0,
                                  // ),
                                  // CustomText(
                                  //   text: "Tushar Nikam.",
                                  //   textsize: 68.0,
                                  //   color: Color(0xffCCD6F6),
                                  //   fontWeight: FontWeight.w900,
                                  // ),
                                  // SizedBox(
                                  //   height: 4.0,
                                  // ),
                                  // CustomText(
                                  //   text:
                                  //       "I build things for the Android and web.",
                                  //   textsize: 56.0,
                                  //   color: Color(0xffCCD6F6).withOpacity(0.6),
                                  //   fontWeight: FontWeight.w700,
                                  // ),
                                  // SizedBox(
                                  //   height: size.height * .04,
                                  // ),
                                  // Wrap(
                                  //   children: [
                                  //     Text(
                                  //       "I'm a freelancer based in Nashik, IN specializing in \nbuilding (and occasionally designing) exceptional websites, \napplications, and everything in between.",
                                  //       style: TextStyle(
                                  //         color: Colors.grey,
                                  //         fontSize: 16.0,
                                  //         letterSpacing: 2.75,
                                  //         wordSpacing: 0.75,
                                  //       ),
                                  //     )
                                  //   ],
                                  // ),
                                  // SizedBox(
                                  //   height: size.height * .12,
                                  // ),

                                  //get in tuch text
                                  // InkWell(
                                  //   onTap: () {
                                  //     method.launchEmail();
                                  //   },
                                  //   hoverColor:
                                  //       Color(0xff64FFDA).withOpacity(0.2),
                                  //   borderRadius: BorderRadius.circular(4.0),
                                  //   child: Container(
                                  //     alignment: Alignment.center,
                                  //     height: size.height * 0.09,
                                  //     width: size.width * 0.14,
                                  //     decoration: BoxDecoration(
                                  //       border: Border.all(
                                  //         color: Color(0xff64FFDA),
                                  //       ),
                                  //       borderRadius:
                                  //           BorderRadius.circular(4.0),
                                  //     ),
                                  //     child: Text(
                                  //       "Get In Touch",
                                  //       style: TextStyle(
                                  //         color: Color(0xff64FFDA),
                                  //         letterSpacing: 2.75,
                                  //         wordSpacing: 1.0,
                                  //         fontSize: 15.0,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  //
                                  // SizedBox(
                                  //   height: size.height * 0.20,
                                  // ),
                                ],
                              ),



                              //About Me
                              _wrapScrollTag(
                                index: 0,
                                child: About(),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),

                              //Where I've Worked
                              _wrapScrollTag(
                                index: 1,
                                child:Work()
                              ),
                              SizedBox(
                                height: size.height * 0.10,
                              ),

                              //Some Things I've Built Main Project
                              _wrapScrollTag(
                                  index: 2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: CustomText(
                                          text: "Login",
                                          textsize: 26.0,
                                          color: kTextColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),

                                      // MainTiitle(
                                      //   number: "0.3",
                                      //   text: "Some Things I've Built",
                                      // ),
                                      SizedBox(
                                        height: size.height * 0.04,
                                      ),
                                      FeatureProject(
                                        imagePath: "images/pic9.jpg",
                                        ontab: () {
                                          method.launchURL(
                                              "https://github.com/champ96k/WhatsApp--UI-Clone");
                                        },
                                        projectDesc:
                                            "A Mobile app for both Android and IOS. View your Status, Chat, and call history. The purpose of this projcet is to Learn Flutter complex UI Design.",
                                        projectTitle: "WhatsaApp UI Clone",
                                        tech1: "Flutter",
                                        tech2: "Dart",
                                        tech3: "Flutter UI",
                                      ),

                                      // FeatureProject(
                                      //   imagePath: "images/pic2.jpg",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/champ96k/Flutter-Blog-App-using-Firebase");
                                      //   },
                                      //   projectDesc:
                                      //       "A blog application using Flutter and firebase, In this project implement Firebase CURD operation, User can add post as well see all the post.",
                                      //   projectTitle: "Blog Application",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Firebase",
                                      // ),
                                      //
                                      // FeatureProject(
                                      //   imagePath: "images/pic3.png",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/champ96k/Wallpaper-Hub-using-Flutter");
                                      //   },
                                      //   projectDesc:
                                      //       "A Wallpaper application Using Pixel API, to show more than 5k+ images. User can Search any images, as well as Download and directly set Image as Wallpaper.",
                                      //   projectTitle: "Wallpaper Hub",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "API",
                                      // ),
                                      //
                                      // FeatureProject(
                                      //   imagePath: "images/pic4.jpg",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/champ96k/coronavirus-tracker-app");
                                      //   },
                                      //   projectDesc:
                                      //       "A Flutter app to track Coronavirus outbreak, Current statistics of global total confirmed, deaths, recovered cases, Health news, coronavirus safety information and many more.",
                                      //   projectTitle: "Covid19 Tracker",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "API",
                                      // ),
                                      // //ff
                                      // FeatureProject(
                                      //   imagePath: "images/pic5.jpg",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/champ96k/Gender-Predictor-Flutter-App");
                                      //   },
                                      //   projectDesc:
                                      //       "In this app you can predict the gender with the help of name and probability of that name.",
                                      //   projectTitle: "Gender Predictor",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "API",
                                      // ),
                                      //
                                      // FeatureProject(
                                      //   imagePath: "images/pic6.jpg",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/champ96k/News-Hours-Apps-Using-Rest-API");
                                      //   },
                                      //   projectDesc:
                                      //       "complete news Application using rest API API link- https://newsapi.org, you can get all news.",
                                      //   projectTitle: "News Hour",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "API",
                                      // ),
                                      //
                                      // FeatureProject(
                                      //   imagePath: "images/pic7.jpg",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/champ96k/Flutter-wallpaper-App-using-Firebase");
                                      //   },
                                      //   projectDesc:
                                      //       "Flutter Wallpaper application using firebase as a backend with a cool animation, it show the all images that are store in firebase firestore.",
                                      //   projectTitle: "Wallpaper App",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Firebase",
                                      // ),
                                      //
                                      // FeatureProject(
                                      //   imagePath: "images/pic8.jpg",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/champ96k/Flutter-Weather-Application");
                                      //   },
                                      //   projectDesc:
                                      //       "Weather app. This weather app is one of best free weather apps with full features: Local weather, weather map (weather map service) and weather widgets. Widgets for Android: The weather radar widget free and clock widget weather with beautiful style.",
                                      //   projectTitle: "Weather Application",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "API",
                                      // ),
                                      //
                                      // FeatureProject(
                                      //   imagePath: "images/pic10.jpg",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://pub.dev/packages/flutter_onboarding_screen");
                                      //   },
                                      //   projectDesc:
                                      //       "A flutter package which help developer in creating a onboarding screens of their app.",
                                      //   projectTitle:
                                      //       "Flutter Onboarding Screen Package",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Dart Package",
                                      // ),
                                      //
                                      // FeatureProject(
                                      //   imagePath: "images/pic11.jpg",
                                      //   ontab: () {
                                      //     method.launchURL(
                                      //         "https://github.com/champ96k/Flutter-Neumorphic-Calculator-UI");
                                      //   },
                                      //   projectDesc:
                                      //       "To explore the flutter Neumorphic design",
                                      //   projectTitle: "Neumorphic Design",
                                      //   tech1: "Dart",
                                      //   tech2: "Flutter",
                                      //   tech3: "Flutter UI",
                                      // ),

                                    ],
                                  )),

                              SizedBox(
                                height: 6.0,
                              ),

                              //Get In Touch
                              _wrapScrollTag(
                                index: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: size.height * 0.68,
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      // color: Colors.orange,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: "Cadastrar",
                                            textsize: 42.0,
                                            color: Colors.black,
                                            letterSpacing: 3.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          // CustomText(
                                          //   text: "Cadastrar",
                                          //   textsize: 16.0,
                                          //   color: Colors.black,
                                          //   letterSpacing: 3.0,
                                          // ),
                                          SizedBox(
                                            height: 16.0,
                                          ),

                                          SizedBox(
                                            height: 16.0,
                                          ),
                                          Wrap(
                                            children: [
                                              Text(
                                                "Although I'm currently looking for SDE-1 opportunities, my inbox is \nalways open. Whether you have a question or just want to say hi, I'll try my \nbest to get back to you!",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.4),
                                                  letterSpacing: 0.75,
                                                  fontSize: 17.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 32.0,
                                          ),
                                          // InkWell(
                                          //   onTap: () {
                                          //     method.launchEmail();
                                          //   },
                                          //   child: Card(
                                          //     elevation: 4.0,
                                          //     color: Color(0xff64FFDA),
                                          //     shape: RoundedRectangleBorder(
                                          //       borderRadius:
                                          //           BorderRadius.circular(6.0),
                                          //     ),
                                          //     child: Container(
                                          //       margin: EdgeInsets.all(0.85),
                                          //       height: size.height * 0.09,
                                          //       width: size.width * 0.10,
                                          //       alignment: Alignment.center,
                                          //       decoration: BoxDecoration(
                                          //         color: Color(0xff0A192F),
                                          //         borderRadius:
                                          //             BorderRadius.circular(
                                          //                 6.0),
                                          //       ),
                                          //       child: Padding(
                                          //         padding: const EdgeInsets
                                          //             .symmetric(
                                          //           horizontal: 8.0,
                                          //         ),
                                          //         child: Text(
                                          //           "Say Hello",
                                          //           style: TextStyle(
                                          //             color: Color(0xff64FFDA),
                                          //           ),
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),

                                    //Footer
                                    Container(
                                      alignment: Alignment.center,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              6,
                                      width: MediaQuery.of(context).size.width -
                                          100,
                                      //color: Colors.white,
                                      child: Text(
                                        "Designed & Built by Cadica Team 2022",
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.4),
                                          letterSpacing: 1.75,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ])),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width * 0.07,
                  //   height: MediaQuery.of(context).size.height - 82,
                  //   //color: Colors.orange,
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: [
                  //       RotatedBox(
                  //         quarterTurns: 45,
                  //         child: Text(
                  //           "tusharnikam2021@gmail.com",
                  //           style: TextStyle(
                  //             color: Colors.grey.withOpacity(0.6),
                  //             letterSpacing: 3.0,
                  //             fontWeight: FontWeight.w700,
                  //           ),
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.only(top: 16.0),
                  //         child: Container(
                  //           height: 100,
                  //           width: 2,
                  //           color: Colors.grey.withOpacity(0.4),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ));
  }
}
