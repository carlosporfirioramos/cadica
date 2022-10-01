import 'package:flutter/material.dart';
import 'package:cadica/Widget/work_custom_data.dart';

class WorkBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WorkCustomData(
          title: "Poupança",
          subTitle: "A CADICA não é uma simples carteira digital, somos também um meio de poupança.",
          duration: "",
        ),
        WorkCustomData(
          title: "Cupons de descontos",
          subTitle:
              "Com a CADICA você aproveita as melhores opções de cupons de descontos e ainda pode aproveitar para ganhar o seu dinheiro de volta \nna compra de um produto ou serviço dos nossos parceiros.",
          duration: "",
        ),
        WorkCustomData(
          title:
              "Oportunidades",
          subTitle:
              "Temos um leque de oportunidades para si!",
          duration: "",
        ),
        // WorkCustomData(
        //   title: "Mentor at Contributor's Hack, 2020",
        //   subTitle:
        //       "Working as a mentor in HakinCode organization for Flutter CodeAsylums application \n where I can utilize my skills and be an asset to the organization",
        //   duration: "Sep 2020 - Oct 2020",
        // ),
        // WorkCustomData(
        //   title: "Flutter Intern at Mind Sports League | Gurgaon In",
        //   subTitle:
        //       "Building world class Poker Learning platform. Poker Sports League is India’s first poker league is to sportify the game of poker through a unique, team based format",
        //   duration: "Nov - 2020 Present",
        // ),
      ],
    );
  }
}
