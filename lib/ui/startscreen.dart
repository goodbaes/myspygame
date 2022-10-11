import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spygame/data/consts/const.dart';
import 'package:spygame/ui/myhomepage.dart';
import 'package:spygame/ui/rules.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            fit: StackFit.expand,
            children: [
              Positioned(
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(kmainImage),
                ),
              ),
              Positioned(
                bottom: 20,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StartButton(
                        onTapVoid: () {
                          Get.to(() => MyHomePage());
                        },
                        text: "startWithRandom",
                      ),
                      StartButton(
                        onTapVoid: () {
                          Get.to(() => RuleScreen());
                        },
                        text: "rule",
                      ),
                      // StartButton(
                      //   onTapVoid: () {
                      //     SystemNavigator.pop();
                      //   },
                      //   text: "exit",
                      // )
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
