import 'dart:math';

import 'package:get/get.dart';

class RoleList {
  int _count = 5;
  int getCount() => _count;
}

class LocationsList extends GetxController {
  List list = [
    "SwimPool",
    "BusStop",
    "Cinema",
    "Spa",
    "Hospital",
    "Hogwarts",
    "ComputerClub",
    "OloloHouse",
    "Sea",
    "Hollywood",
    "Kitchen",
    "Wood",
    "MarianaTrench"
  ];
  List newList = [];
  var rng = Random();
  String getLocation() {
    if (list.length == 0) {
      list = newList;
      update();
    }
    if (list.length > 0) {
      int rnd = rng.nextInt(list.length);
      String loc = list[rnd];
      newList.add(loc);
      list.removeAt(rnd);
      update();
      print(list);
      return loc;
    }
  }
}
