import 'package:flutter/material.dart';
import 'package:spygame/data/consts/const.dart';
import 'package:spygame/ui/myhomepage.dart';

class RuleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: MyTextH1(text: 'rule'),
        ),
        body: Container(
          child: Stack(
            alignment: AlignmentDirectional.center,
            fit: StackFit.expand,
            children: [
              Image(
                color: Color.fromARGB(200, 0, 0, 0),
                colorBlendMode: BlendMode.darken,
                fit: BoxFit.cover,
                image: AssetImage(kmainImage),
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
    );
  }
}
