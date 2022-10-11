part of 'game_settings_cubit.dart';

abstract class GameSettingsState extends Equatable {
  GameSettingsState();
  int spys = 1;
  int players = 1;
  int timer = 1;
  List<Player> getPlayerList(String location) {
    List<Player> playerList = [];
    String loc = location;
    List pList = List<Player>.generate(players, (index) => PlayerFromlist(loc));
    List sList = List<Player>.generate(spys, (index) => PlayerFromlistSpy());
    playerList = pList + sList;
    playerList.shuffle();
    return playerList;
  }

  @override
  List<Object> get props => [];
}

class GameSettingsInitial extends GameSettingsState {
  GameSettingsInitial() : super();
}

class GameSettingsSecond extends GameSettingsState {
  GameSettingsSecond() : super();
}
