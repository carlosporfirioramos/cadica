// import 'dart:io';
import 'package:cadica/UI/singup.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cadica/Model/Method.dart';
import 'package:cadica/UI/About.dart';
import 'package:cadica/UI/FeatureProject.dart';
import 'package:cadica/UI/Work.dart';
import 'package:cadica/Widget/AppBarTitle.dart';
import 'package:cadica/Widget/CustomText.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../contants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool obscuredPass = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController usernameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  bool isLoading = false;
  bool _loading = false;
  bool userExist = true;
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
                      Container(
                        height: 200,//size.height * 0.60,
                        width: 200,//size.width * 0.5,
                        //color: Colors.redAccent,
                        child: Image(
                          fit: BoxFit.contain,
                          image: AssetImage("assets/images/CADICASFS.png"),
                        ),
                      ),
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
                                    text: 'Quem somos',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'O que fazemos',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Parceiros',
                                  ),
                                ),
                                Tab(
                                  child: AppBarTitle(
                                    text: 'Entrar',
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

              Form(
                key:formKey,
                child: Row(
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
                                            text: "Parceiros",
                                            textsize: 40.0,
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
                                          imagePath: "images/logo3.png",
                                          ontab: () {
                                            method.launchURL(
                                                "");
                                          },
                                          projectDesc:
                                              "Investe me é uma solução que facilita investimentos para startups de pequenas e médias empresas",
                                          projectTitle: "Invest.me",
                                          desconto: '4',
                                        ),
                                        FeatureProject(
                                          desconto: '2',
                                          imagePath: "images/logo4.png",
                                          ontab: () {
                                            method.launchURL(
                                                "");
                                          },
                                          projectDesc:
                                              "Prestação de serviços de marketing, comunicação e design.",
                                          projectTitle: "Marka - Agência Digital",
                                        ),
                                        //
                                        FeatureProject(
                                          desconto: '3',
                                          imagePath: "images/logo5.png",
                                          ontab: () {
                                            method.launchURL(
                                                "");
                                          },
                                          projectDesc: "",
                                          projectTitle: "Sistec",

                                        ),
                                        //
                                        FeatureProject(
                                          desconto: '1.5',
                                          imagePath: "images/seaside.png",
                                          ontab: () {
                                            method.launchURL(
                                                "");
                                          },
                                          projectDesc:
                                              "",
                                          projectTitle: "Seaside",
                                        ),
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: MediaQuery.of(context).size.height,//size.height * 0.68,
                                        width: MediaQuery.of(context).size.width - 100,
                                        // color: Colors.orange,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomText(
                                              text: "Entrar",
                                              textsize: 42.0,
                                              color: Colors.black,
                                              letterSpacing: 3.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width/3,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                  BorderRadius.vertical(top: Radius.circular(12))),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 48.0, left: 28.0, right: 28.0),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        userExist
                                                            ? SizedBox(
                                                          height: 0,
                                                        )
                                                            : Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Text(
                                                            "Utilizador inexistente ou palavra passe errada, verifique os dados inseridos",
                                                            style: TextStyle(
                                                                color: Colors.red, fontSize: 11),
                                                          ),
                                                        ),
                                                        Container(
                                                          child: TextFormField(
                                                            controller: usernameTextController,
                                                            onTap: () {
                                                              // showSearch(context: context, delegate: DataSearch());
                                                            },
                                                            validator: (email) {
                                                              if (!EmailValidator.validate(email as String)) {
                                                                return "Email invalido";
                                                              }
                                                            },
                                                            keyboardType: TextInputType.emailAddress,
                                                            decoration: InputDecoration(
                                                                prefixIcon: Icon(
                                                                  Icons.mail,
                                                                  size: 22,
                                                                ),
                                                                labelText: "E-mail",
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                    BorderRadius.circular(50))),
                                                          ),
                                                          // height: MediaQuery.of(context).size.height / 16,
                                                          // width: 306,
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Container(
                                                          child: TextFormField(
                                                            controller: passwordTextController,
                                                            obscureText: obscuredPass,
                                                            keyboardType: TextInputType.emailAddress,
                                                            decoration: InputDecoration(
                                                                prefixIcon: Icon(Icons.vpn_key),
                                                                suffixIcon: InkWell(
                                                                  child: Padding(
                                                                    padding:
                                                                    const EdgeInsets.only(right: 8.0),
                                                                    child: Icon(
                                                                      Icons.visibility,
                                                                      size: 22,
                                                                    ),
                                                                  ),
                                                                  onTap: () {
                                                                    setState(() {
                                                                      if (obscuredPass) {
                                                                        obscuredPass = false;
                                                                      } else
                                                                        obscuredPass = true;
                                                                    });
                                                                  },
                                                                ),
                                                                labelText: "Palavra-passe",
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                    BorderRadius.circular(50))),
                                                          ),
                                                          // width: 306,
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        TextButton(
                                                            style: TextButton.styleFrom(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                    BorderRadius.circular(50)),
                                                                backgroundColor: Colors.amberAccent,
                                                                minimumSize: Size(
                                                                    600,
                                                                    MediaQuery.of(context).size.height /
                                                                        16)),
                                                            onPressed: () async {
                                                              if (formKey.currentState!.validate()) {
                                                                Navigator.of(context).push(
                                                                        MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                SingUpPage(user: null,)));

                                                              }
                                                            },
                                                            child: isLoading
                                                                ? Container(
                                                              width: 20,
                                                              height: 20, child: CircularProgressIndicator(
                                                                valueColor:
                                                                AlwaysStoppedAnimation<Color>(
                                                                    Colors.white),
                                                              ),
                                                            )
                                                                : Text(
                                                              "Entrar",
                                                              style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize: 18),
                                                            )),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        // TextButton(
                                                        //     style: TextButton.styleFrom(
                                                        //       shape: RoundedRectangleBorder(
                                                        //         borderRadius: BorderRadius.circular(50),
                                                        //       ),
                                                        //       backgroundColor: Colors.white,
                                                        //       side: BorderSide(width: 1),
                                                        //       minimumSize: Size(
                                                        //           600,
                                                        //           MediaQuery.of(context).size.height /
                                                        //               16),
                                                        //     ),
                                                        //     onPressed: () {
                                                        //       _setLoading(true);
                                                        //     },
                                                        //     child: Row(
                                                        //       // crossAxisAlignment: CrossAxisAlignment.center,
                                                        //       mainAxisAlignment: MainAxisAlignment.center,
                                                        //       children: [
                                                        //         // Padding(
                                                        //         //   padding: const EdgeInsets.only(
                                                        //         //       right: 12.0, left: 10),
                                                        //         //   child: SvgPicture.asset(
                                                        //         //     'assets/newicons/google_icon.svg',
                                                        //         //     width: 20,
                                                        //         //   ),
                                                        //         // ),
                                                        //         // Center(
                                                        //         //   child: Text(
                                                        //         //     "Entrar com Google",
                                                        //         //     style: TextStyle(
                                                        //         //         color: Colors.black,
                                                        //         //         fontSize: 18),
                                                        //         //   ),
                                                        //         // )
                                                        //       ],
                                                        //     )),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(bottom: 48.0),
                                                      child: Container(
                                                        width: MediaQuery.of(context).size.width,
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text("Não tem uma conta? "),
                                                            TextButton(
                                                                // style: TextButton.styleFrom(
                                                                //   // backgroundColor: Colors.black,
                                                                //   side: BorderSide(width: 1),
                                                                //   minimumSize: Size(
                                                                //       600,
                                                                //       MediaQuery.of(context).size.height /
                                                                //           16),
                                                                // ),
                                                                onPressed: () {
                                                                  Navigator.of(context).push(
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              SingUpPage(user: null,)));
                                                                },
                                                                child: Row(
                                                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    
                                                                    Center(
                                                                      child: Text(
                                                                        "Criar conta",
                                                                        style: TextStyle(
                                                                            color: Colors.black,
                                                                            fontWeight: FontWeight.w600,
                                                                            fontSize: 12),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
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
                                      // Container(
                                      //   alignment: Alignment.center,
                                      //   height:
                                      //       MediaQuery.of(context).size.height /
                                      //           6,
                                      //   width: MediaQuery.of(context).size.width -
                                      //       100,
                                      //   //color: Colors.white,
                                      //   child: Text(
                                      //     "Designed & Built by Cadica Team 2022",
                                      //     style: TextStyle(
                                      //       color: Colors.black.withOpacity(0.4),
                                      //       letterSpacing: 1.75,
                                      //       fontSize: 14.0,
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ])
                              ),
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
              ),
            ],
          ),
        ));
  }

  void _setLoading(value) {
    setState(() {
      _loading = value;
    });
  }
}
