import 'package:get/get.dart';
import 'package:spyprj1/data/lists.dart';

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
}
