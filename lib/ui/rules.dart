import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spyprj1/data/enums.dart';
import 'package:spyprj1/ui/myhomepage.dart';
import 'package:spyprj1/ui/startscreen.dart';

class RuleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: Theme.of(context).hintColor,
            ),
            onPressed: () {
              Get.offAll(() => StartScreen());
            }),
      ),
      body: Center(
        child: Container(
          child: Stack(
            alignment: AlignmentDirectional.center,
            fit: StackFit.expand,
            children: [
              Image(
                color: Color.fromARGB(200, 0, 0, 0),
                colorBlendMode: BlendMode.darken,
                fit: BoxFit.cover,
                image: AssetImage("assets/graphic/main.png"),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MyTextH1white(
                      text: "rule",
                    ),
                    MyTextH2white(
                      text: "ruleOverview",
                    ),
                    MyTextH2white(
                      text: "ruleResidentGaal",
                    ),
                    MyTextH2white(
                      text: "ruleSpyGoal",
                    ),
                    MyTextH2white(
                      text: "ruleRound",
                    ),
                    MyTextH2white(
                      text: "ruleWhenGameEnds",
                    ),
                    MyTextH2white(
                      text: "ruleYourGame",
                    ),
                  ],
                ),
              )
              // StartButton(
              //   onTapVoid: () {
              //     SystemNavigator.pop();
              //   },
              //   text: "exit",
            ],
          ),
        ),
      ),
    ));
  }
}
