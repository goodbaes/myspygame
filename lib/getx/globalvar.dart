import 'package:get/get.dart';
import 'package:spyprj1/data/lists.dart';
import 'package:spyprj1/data/storeoutput.dart';

enum pages {
  main,
  random,
  your,
}

class MyNaviagtion extends GetxController {}

class GlobalVariable extends GetxController {
  int spys = 1;
  int players = 1;
  int timer = 60;
  String location;
  LocationsList locationsList = LocationsList();
  locationClear() {
    location = "";
  }

  fromMyField(String myLoc) {
    location = myLoc;
    update();
  }

  incrementSpys() {
    spys++;
    update();
  }

  decrementSpys() {
    spys > 1 ? spys-- : spys = spys;
    update();
  }

  incrementPlayer() {
    players++;
    update();
  }

  decrementTimer() {
    timer > 60 ? timer = timer - 60 : timer = timer;
    update();
  }

  decrementPlayer() {
    players > 1 ? players-- : players = players;
    update();
  }

  incrementTimer() {
    timer = timer + 60;
    update();
  }

  List<Player> playerList = [];
  getPlayerList(loc) {
    playerList = [];
    List pList =
        List<Player>.generate(players - 1, (index) => PlayerFromlist(loc));
    List sList = List<Player>.generate(spys, (index) => PlayerFromlistSpy());
    playerList = pList + sList;
    playerList.shuffle();
    playerList.insert(
      0,
      PlayerFromlist(loc),
    );
    update();
  }

  getPlayerListRandom() {
    playerList = [];
    String loc = locationsList.getLocation();
    List pList = List<Player>.generate(players, (index) => PlayerFromlist(loc));
    List sList = List<Player>.generate(spys, (index) => PlayerFromlistSpy());
    playerList = pList + sList;
    playerList.shuffle();

    update();
  }
}
