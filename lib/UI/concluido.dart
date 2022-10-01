import 'package:cadica/contants.dart';
import 'package:flutter/material.dart';

import '../Widget/CustomText.dart';

class Concluido extends StatelessWidget {
  const Concluido({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kPrimaryDelivery,
      body: SafeArea(
        child: Container(
          child: Center(
            child: CustomText(
              text: "Concluído",
              textsize: 42.0,
              color: Colors.black,
              letterSpacing: 3.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
