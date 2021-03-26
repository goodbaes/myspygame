import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:spyprj1/data/consts/const.dart';
import 'package:easy_localization/easy_localization.dart' as localization;
import 'package:spyprj1/data/lists.dart';
import 'package:spyprj1/getx/globalvar.dart';
import 'package:spyprj1/ui/showcard.dart';
import 'package:spyprj1/ui/theme/customtheme.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String myLocation;
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(
                  Icons.camera_outlined,
                ),
                onPressed: () {
                  Get.changeTheme(
                    Get.isDarkMode ? MyTheam.lightTheme : MyTheam.dark,
                  );
                })
          ],
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
                    count: value.players.value.toString(),
                    text: "citizen",
                    imgUrl: kplayerImage,
                  ),
                  PlayerCard(
                    count: value.spys.value.toString(),
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
                              GestureDetector(
                                onLongPress: () {
                                  value.decrementTimer();
                                },
                                child: IconForCount(
                                  myFunc: () {
                                    value.decrementTimer();
                                  },
                                  icon: Icons.remove,
                                ),
                              ),
                              TextButton(
                                style: ButtonStyle(),
                                onPressed: () {},
                                child: MyTextH1text(
                                  text: ((value.timer.value ~/ 60).toInt())
                                      .toString(),
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
                  StartButton(
                    onTapVoid: () {
                      LocationsList ll = Get.find();

                      Get.to(() => MyShowCardPage(
                            location: ll.getLocation(),
                            s: value.spys.toInt(),
                            p: value.players.toInt(),
                          ));
                    },
                    text: "start",
                  ),
                  Container(
                    width: SizeConfig.blockSizeHorizontal * 60,
                    child: TextField(
                      minLines: 1,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 4),
                        hintText: localization.tr("yourLocation"),
                        suffixIcon: Icon(
                          Icons.location_city,
                          color: Colors.amber,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(20),
                      ),
                      onChanged: (value) {
                        myLocation = value;
                        print(myLocation);
                      },
                    ),
                  ),
                  StartButton(
                    onTapVoid: () {
                      if (myLocation != null) {
                        Get.to(() => MyShowCardPage(
                              location: myLocation,
                              s: value.spys.toInt(),
                              p: value.players.toInt(),
                            ));
                      }
                    },
                    text: "startWithMyLocation",
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
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              // BoxShadow(
              //   color: Colors.grey.withOpacity(0.5),
              //   spreadRadius: 1,
              //   blurRadius: 5,
              //   offset: Offset(0, 1), // changes position of shadow
              // ),
            ], borderRadius: BorderRadius.circular(10)),
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

class PlayerCard extends StatelessWidget {
  const PlayerCard(
      {Key key,
      this.text,
      this.imgUrl,
      this.count,
      this.minusFunc,
      this.plusFunc})
      : super(key: key);
  final String text;
  final String imgUrl;
  final Function minusFunc;
  final Function plusFunc;
  final String count;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Container(
          height: SizeConfig.blockSizeVertical * 25,
          width: SizeConfig.blockSizeHorizontal * 80,
          child: Container(
            child: Stack(
              children: [
                Positioned(
                  bottom: -SizeConfig.blockSizeHorizontal * 10,
                  left: -SizeConfig.blockSizeHorizontal * 10,
                  child: CircleAvatar(
                    foregroundImage: AssetImage(imgUrl),
                    minRadius: SizeConfig.blockSizeHorizontal * 10,
                    maxRadius: SizeConfig.blockSizeHorizontal * 32,
                  ),
                ),
                Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          MyTextH1(
                            text: text,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius:
                                    BorderRadius.circular(kborderRadiusCard)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconForCount(
                                  icon: Icons.add,
                                  myFunc: plusFunc,
                                ),
                                TextButton(
                                    style: ButtonStyle(),
                                    onPressed: () {},
                                    child: MyTextH1text(text: count)),
                                IconForCount(
                                  myFunc: minusFunc,
                                  icon: Icons.remove,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
              ],
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
          size: SizeConfig.blockSizeVertical * 5,
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
