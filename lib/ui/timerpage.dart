import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spyprj1/data/consts/const.dart';
import 'package:spyprj1/getx/globalvar.dart';
import 'package:spyprj1/ui/myhomepage.dart';

class CountDownTimer extends StatefulWidget {
  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.topCenter,
            children: [
              Image(
                  color: Colors.black54,
                  colorBlendMode: BlendMode.hardLight,
                  fit: BoxFit.cover,
                  image: AssetImage(kspyImage)),
              Padding(
                padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 5),
                child: GetBuilder<GlobalVariable>(
                  init: GlobalVariable(),
                  builder: (global) {
                    return CircularTimer(time: global.timer.toInt());
                  },
                ),
              ),
              SizedBox(
                height: 0,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: SizeConfig.blockSizeHorizontal * 100,
                  color: Colors.amber,
                  child: Card(
                    elevation: 0,
                    child: Container(
                      width: SizeConfig.blockSizeHorizontal * 100,
                      child: TextButton(
                        onPressed: () {
                          Get.offAll(() => MyHomePage());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MyTextH1(text: "restartGame"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
    return CircularCountDownTimer(
      duration: time,
      initialDuration: 0,
      controller: CountDownController(),
      width: MediaQuery.of(context).size.width / 1.5,
      height: MediaQuery.of(context).size.height / 1.5,
      ringColor: Theme.of(context).backgroundColor,
      ringGradient: null,
      fillColor: Theme.of(context).indicatorColor,
      fillGradient: null,
      backgroundColor: Theme.of(context).accentColor,
      backgroundGradient: null,
      strokeWidth: 20.0,
      strokeCap: StrokeCap.round,
      textStyle: TextStyle(
          fontSize: SizeConfig.blockSizeVertical * 10,
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
    );
  }
}
