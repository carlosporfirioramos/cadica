import 'package:cadica/contants.dart';
import 'package:flutter/material.dart';
import 'package:cadica/Widget/CustomText.dart';

class About extends StatelessWidget {
  Widget technology(BuildContext context, String text) {
    return Row(
      children: [
        Icon(
          Icons.skip_next,
          color: Color(0xff64FFDA).withOpacity(0.6),
          size: 14.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        Text(
          text,
          style: TextStyle(
            color: Color(0xff717C99),
            letterSpacing: 1.75,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      // height: size.height,
      // width:size.width - 100,
      child: Row(
        children: [
          //Profile Image
          Expanded(
            child: Container(
              // height: size.height / 1.5,
              // width: size.width / 2 - 100,
              // color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Positioned(
                  //   top: size.height * 0.12,
                  //   left: size.width * 0.120,
                  //   child: Card(
                  //     color: Color(0xff61F9D5),
                  //     child: Container(
                  //       margin: EdgeInsets.all(2.75),
                  //       height: size.height / 2,
                  //       width: size.width / 5,
                  //       color: Color(0xff0A192F),
                  //     ),
                  //   ),
                  // ),
                  CustomImageAnimation()
                ],
              ),
            ),
          ),
          //About me
          Container(
            height: size.height * 0.9,
            width: size.width / 2 - 100,
            child: Column(
              children: [
                //About me title
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Quem somos",
                      textsize: 40.0,
                      color: kTextColor,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    Container(
                      width: size.width / 4,
                      height: 1.10,
                      color: Color(0xff303C55),
                    ),
                  ],
                ),

                SizedBox(
                  height: size.height * 0.07,
                ),

                //About me desc
                Wrap(
                  children: [
                    CustomText(
                      text:
                          "A CADICA ?? uma carteira digital que permite fazer pagamentos em tempo "
                              "real em e-commerces com o benef??cio de cashback e permite fazer o "
                              "pagamento parcelado com o cart??o de d??bito virtual.\n"
                              "\nRecarregue e pague os bens e servi??os atrav??s da CADICA de modo simples, r??pido e seguro.",
                      textsize: 16.0,
                      color: Color(0xff828DAA),
                      letterSpacing: 0.75,
                    ),
                  ],
                ),

                // Container(
                //   height: size.height * 0.15,
                //   width: size.width,
                //   child: Wrap(
                //     children: [
                //       Container(
                //         width: size.width * 0.20,
                //         height: size.height * 0.15,
                //         child: Column(
                //           children: [
                //             technology(context, "Dart"),
                //             technology(context, "Flutter"),
                //             technology(context, "Firebase"),
                //             technology(context, "UI/UX (Adobe Xd)"),
                //           ],
                //         ),
                //       ),
                //       Container(
                //         width: size.width * 0.15,
                //         height: size.height * 0.15,
                //         child: Column(
                //           children: [
                //             technology(context, "C/C++, Java."),
                //             technology(context, "HTML & (S)CSS"),
                //             technology(context, "MYSQL"),
                //             technology(context, "Git - Github"),
                //           ],
                //         ),
                //       )
                //     ],
                //   ),
                // )
              ],
            ),
          ),


        ],
      ),
    );
  }
}

class CustomImageAnimation extends StatefulWidget {
  CustomImageAnimation({Key? key}) : super(key: key);

  @override
  _CustomImageAnimationState createState() => _CustomImageAnimationState();
}

class _CustomImageAnimationState extends State<CustomImageAnimation> {
  Color customImageColor = Color(0xff61F9D5).withOpacity(0.5);
  // ignore: unused_field
  int _enterCounter = 0;
  // ignore: unused_field
  int _exitCounter = 0;
  double x = 0.0;
  double y = 0.0;

  void _incrementEnter(PointerEvent details) {
    setState(() {
      _enterCounter++;
    });
  }

  void _incrementExit(PointerEvent details) {
    setState(() {
      customImageColor = Color(0xff61F9D5).withOpacity(0.5);
      _exitCounter++;
    });
  }

  void _updateLocation(PointerEvent details) {
    setState(() {
      customImageColor = Colors.transparent;
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height ,
      width: size.width ,
      color: Colors.transparent,
      child: Image(
        fit: BoxFit.cover,
        image: AssetImage("images/cheque1.png"),//todo aqui
      ),
    );
  }
}
