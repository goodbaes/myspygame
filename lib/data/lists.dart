import 'dart:math';

class LocationsList {
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
    "MarianaTrench",
    "Stadium",
    "Mine",
    "Museum",
    "Library",
    "Wedding",
    "Underground",
    "Cemetery",
    "Prison",
  ];
  List newList = [];
  var rng = Random();
  String getRandomLocation() {
    int index = rng.nextInt(list.length - 1);
    return list[index];
  }

  String getLocation() {
    if (list.length == 0) {
      list = newList;
    }
    if (list.length > 0) {
      int rnd = rng.nextInt(list.length);
      String loc = list[rnd];
      newList.add(loc);
      list.removeAt(rnd);
      print(list);
      return loc;
    }
  }
}
