import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spyprj1/data/consts/const.dart';
import 'package:spyprj1/getx/globalvar.dart';
import 'package:spyprj1/ui/myhomepage.dart';
import 'package:spyprj1/ui/startscreen.dart';

class CountDownTimer extends StatefulWidget {
  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.topCenter,
              children: [
                Image(
                  color: Color.fromARGB(200, 0, 0, 0),
                  colorBlendMode: BlendMode.darken,
                  fit: BoxFit.cover,
                  image: AssetImage(kspyImage),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyTextH2whiteCenter(
                      text: "timerControl",
                    ),
                    Padding(
                      padding:
                          EdgeInsets.all(SizeConfig.blockSizeHorizontal * 5),
                      child: GetBuilder<GlobalVariable>(
                        init: GlobalVariable(),
                        builder: (global) {
                          return CircularTimer(time: global.timer.toInt());
                        },
                      ),
                    ),
                    Container(
                      width: SizeConfig.blockSizeHorizontal * 100,
                      color: Colors.amber,
                      child: Card(
                        elevation: 0,
                        child: Container(
                          width: SizeConfig.blockSizeHorizontal * 100,
                          child: TextButton(
                            onPressed: () {
                              Get.off(() => StartScreen());
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MyTextH1(text: "restartGame"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CircularTimer extends StatelessWidget {
  CircularTimer({
    this.time,
    Key key,
  }) : super(key: key);
  final int time;
  @override
  Widget build(BuildContext context) {
    CountDownController controller = CountDownController();
    return GestureDetector(
      onTap: () {
        controller.pause();
      },
      onDoubleTap: () {
        controller.resume();
      },
      child: CircularCountDownTimer(
        duration: time,
        initialDuration: 0,
        controller: controller,
        width: SizeConfig.blockSizeHorizontal * 50,
        height: SizeConfig.blockSizeVertical * 50,
        ringColor: Theme.of(context).backgroundColor,
        ringGradient: null,
        fillColor: Theme.of(context).indicatorColor,
        fillGradient: null,
        backgroundColor: Theme.of(context).accentColor,
        backgroundGradient: null,
        strokeWidth: 20.0,
        strokeCap: StrokeCap.round,
        textStyle: TextStyle(
            fontSize: SizeConfig.blockSizeVertical * 5,
            color: Colors.white,
            fontWeight: FontWeight.bold),
        textFormat: CountdownTextFormat.MM_SS,
        isReverse: true,
        isReverseAnimation: true,
        isTimerTextShown: true,
        autoStart: true,
        onStart: () {
          print('Countdown Started');
        },
        onComplete: () {
          print('Countdown Ended');
        },
      ),
    );
  }
}
