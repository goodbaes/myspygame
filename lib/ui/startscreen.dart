import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spyprj1/data/enums.dart';
import 'package:spyprj1/ui/myhomepage.dart';
import 'package:spyprj1/ui/rules.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          fit: StackFit.expand,
          children: [
            Positioned(
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage("assets/graphic/main.png"),
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
                        Get.to(() => MyHomePage(
                              type: GameType.random,
                            ));
                      },
                      text: "startWithRandom",
                    ),
                    StartButton(
                      onTapVoid: () {
                        Get.to(() => MyHomePage(
                              type: GameType.playerInput,
                            ));
                      },
                      text: "startWithMyLocation",
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
    ));
  }
}
