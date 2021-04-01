import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:spyprj1/data/consts/const.dart';
import 'package:easy_localization/easy_localization.dart' as localization;
import 'package:spyprj1/data/enums.dart';
import 'package:spyprj1/getx/globalvar.dart';
import 'package:spyprj1/ui/showcard.dart';
import 'package:spyprj1/ui/startscreen.dart';
import 'package:spyprj1/ui/widgets/buttons.dart';
import 'package:spyprj1/ui/widgets/playercard.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({this.type});
  final GameType type;
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
        body: SingleChildScrollView(
          child: GetBuilder<GlobalVariable>(
            init: GlobalVariable(),
            builder: (value) => Center(
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  PlayerCard(
                    minusFunc: () {
                      value.decrementPlayer();
                    },
                    plusFunc: () {
                      value.incrementPlayer();
                    },
                    count: value.players.toString(),
                    text: "citizen",
                    imgUrl: kplayerImage,
                  ),
                  PlayerCard(
                    count: value.spys.toString(),
                    minusFunc: () {
                      value.decrementSpys();
                    },
                    plusFunc: () {
                      value.incrementSpys();
                    },
                    text: "spy",
                    imgUrl: kspyImage,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: SizeConfig.blockSizeHorizontal * 95,
                      child: Column(
                        children: [
                          MyTextH1(
                            text: "gameTime",
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconForCount(
                                myFunc: () {
                                  value.decrementTimer();
                                },
                                icon: Icons.remove,
                              ),
                              TextButton(
                                style: ButtonStyle(),
                                onPressed: () {},
                                child: MyTextH1text(
                                  text:
                                      ((value.timer ~/ 60).toInt()).toString(),
                                ),
                              ),
                              GestureDetector(
                                onLongPress: () {
                                  value.incrementTimer();
                                },
                                child: IconForCount(
                                    icon: Icons.add,
                                    myFunc: () {
                                      value.incrementTimer();
                                    }),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                      visible: (type == GameType.random),
                      child: StartWithRandomLocationButton(value: value)),
                  Visibility(
                      visible: (type == GameType.playerInput),
                      child: StartWithYourLocationButton(value: value)),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StartWithRandomLocationButton extends StatelessWidget {
  const StartWithRandomLocationButton({
    this.value,
    Key key,
  }) : super(key: key);
  final GlobalVariable value;
  final GameType type = GameType.playerInput;
  @override
  Widget build(BuildContext context) {
    return StartButton(
      onTapVoid: () {
        GlobalVariable _g = Get.find();
        _g.getPlayerListRandom();
        Get.to(() => MyShowCardPage());
      },
      text: "start",
    );
  }
}

class StartButton extends StatelessWidget {
  const StartButton({Key key, this.onTapVoid, this.text}) : super(key: key);
  final Function onTapVoid;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () => onTapVoid(),
        child: Card(
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(4),
            alignment: Alignment.center,
            width: SizeConfig.blockSizeHorizontal * 80,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyTextH1(
                text: text,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class IconForCount extends StatelessWidget {
  const IconForCount({this.icon, this.myFunc});
  final IconData icon;
  final Function myFunc;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          myFunc();
        },
        child: Icon(
          icon,
          size: SizeConfig.blockSizeVertical * 7,
        ));
  }
}

class MyTextH1text extends StatelessWidget {
  const MyTextH1text({this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: SizeConfig.blockSizeVertical * 4,
      ),
    );
  }
}

class MyTextH1 extends StatelessWidget {
  const MyTextH1({this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      localization.tr(text),
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: SizeConfig.blockSizeVertical * 3,
      ),
    );
  }
}

class MyTextH2 extends StatelessWidget {
  const MyTextH2({this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      localization.tr(text),
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: SizeConfig.blockSizeVertical * 2,
          color: Theme.of(context).accentColor),
    );
  }
}

class MyTextH1white extends StatelessWidget {
  const MyTextH1white({this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Text(localization.tr(text),
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: SizeConfig.blockSizeVertical * 3,
              color: Colors.white,
            )),
      ),
    );
  }
}

class MyTextH2white extends StatelessWidget {
  const MyTextH2white({this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Text(localization.tr(text),
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal * 4,
              color: Colors.white,
            )),
      ),
    );
  }
}

class MyTextH2whiteCenter extends StatelessWidget {
  const MyTextH2whiteCenter({this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Text(localization.tr(text),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: SizeConfig.blockSizeVertical * 3,
              color: Colors.white,
            )),
      ),
    );
  }
}

class MyTextMain extends StatelessWidget {
  const MyTextMain({this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      localization.tr(text),
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: SizeConfig.blockSizeVertical * 5,
      ),
    );
  }
}

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}
