class MainList {}

class GameTimer {
  int minTime = 1;
  int maxTime = 60;
}

abstract class Player {
  int count = 1;
  int maxPlayers = 20;
  String status = '';
  String location;
}

class UnknowPlayer extends Player {
  int count = 1;
  int maxPlayers = 20;
  String status = '';
  String location = '';
}

class PlayerFromlist extends Player {
  PlayerFromlist(this.location);
  int count = 1;
  int maxPlayers = 20;
  String status = "citizen";
  String location;
}

class PlayerFromlistSpy extends Player {
  int count = 1;
  int maxPlayers = 20;
  String status = "missionStart";
  String location = "spy";
}
