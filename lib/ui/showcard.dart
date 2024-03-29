import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spygame/data/consts/const.dart';
import 'package:spygame/data/storeoutput.dart';
import 'package:spygame/ui/myhomepage.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyShowCardPage extends StatelessWidget {
  const MyShowCardPage(this.playerList);

  final List<Player> playerList;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Carousel(
            playerList: playerList,
          ),
        )),
      ),
    );
  }
}

class Carousel extends StatelessWidget {
  Carousel({
    this.playerList,
    Key key,
  }) : super(key: key);
  final CarouselController controller = CarouselControllerImpl();
  void nextpage() => controller.nextPage();
  final List<Player> playerList;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        scrollPhysics: NeverScrollableScrollPhysics(),
        height: SizeConfig.blockSizeVertical * 90,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: false,
        reverse: false,
        autoPlay: false,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.easeInCirc,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      carouselController: controller,
      items: playerList.map((i) {
        int a = playerList.indexOf(i);
        return Builder(
          builder: (BuildContext context) {
            StreamController<Player> streamController = StreamController();
            Player player = UnknowPlayer();
            return StreamBuilder<Player>(
                initialData: player,
                stream: streamController.stream,
                builder: (context, snapshot) {
                  return InkWell(
                    onTap: () {
                      streamController.add(i);
                      if (snapshot.data == i) {
                        streamController.add(player);
                        controller.nextPage();
                      }
                      if (a == playerList.length - 1 && snapshot.data == i) {
                        Get.back(result: true);
                        streamController.close();
                      }
                    },
                    child: Stack(
                        alignment: Alignment.topCenter,
                        fit: StackFit.loose,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: SizeConfig.blockSizeVertical * 100,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              MyTextH1(
                                text: snapshot.data.status,
                              ),
                              Container(
                                width: SizeConfig.blockSizeHorizontal * 70,
                                child: MyTextMain(text: snapshot.data.location),
                              ),
                            ],
                          ),
                          Positioned(
                            child: AnimatedContainer(
                              child: Stack(fit: StackFit.expand, children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(kborderRadiusCard),
                                  child: Visibility(
                                    visible: true,
                                    child: Image(
                                        fit: BoxFit.cover,
                                        image: AssetImage(kplayerImage)),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(kborderRadiusCard),
                                  child: Visibility(
                                    visible: (snapshot.data is PlayerFromlist),
                                    child: Image(
                                        fit: BoxFit.cover,
                                        image: AssetImage(kplayerImage)),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(kborderRadiusCard),
                                  child: Visibility(
                                    visible:
                                        (snapshot.data is PlayerFromlistSpy),
                                    child: Image(
                                        fit: BoxFit.cover,
                                        image: AssetImage(kspyImage)),
                                  ),
                                ),
                              ]),
                              duration: Duration(milliseconds: 300),
                              curve: Curves.decelerate,
                              height: snapshot.data == i
                                  ? SizeConfig.blockSizeVertical * 20
                                  : SizeConfig.blockSizeVertical * 75,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 5), // changes position of shadow
                                  ),
                                ],
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.circular(kborderRadiusCard),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              width: SizeConfig.blockSizeHorizontal * 50,
                              height: SizeConfig.blockSizeVertical * 15,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: MyTextH1(
                                  text: snapshot.data == player
                                      ? "showCard"
                                      : "nextCard",
                                ),
                              ),
                            ),
                          ),
                        ]),
                  );
                });
          },
        );
      }).toList(),
    );
  }
}
