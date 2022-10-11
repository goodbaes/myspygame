import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spygame/data/storeoutput.dart';

part 'game_settings_state.dart';

class GameSettingsCubit extends Cubit<GameSettingsState> {
  GameSettingsCubit() : super(GameSettingsInitial());

  GameSettingsInitial tempState = GameSettingsInitial();
  GameSettingsSecond tempSecondState = GameSettingsSecond();

  emitState() {
    emit(state is GameSettingsInitial ? tempSecondState : tempState);
  }

  void incrementPlayer() {
    tempState.players++;
    tempSecondState.players++;
    emitState();
  }

  void decrementPlayer() {
    if (tempSecondState.players == 0) {
      return;
    }
    tempState.players--;
    tempSecondState.players--;
    emitState();
  }

  void incrementSpy() {
    tempState.spys++;
    tempSecondState.spys++;
    emitState();
  }

  void decrementSpy() {
    if (tempSecondState.spys == 0) {
      return;
    }
    tempState.spys--;
    tempSecondState.spys--;
    emitState();
  }

  void incrementTime() {
    tempState.timer++;
    tempSecondState.timer++;
    emitState();
  }

  void decrementTime() {
    if (tempSecondState.timer == 0) {
      return;
    }
    tempState.timer--;
    tempSecondState.timer--;
    emitState();
  }
}

class PlayerList {
  PlayerList(this.spys, this.players, this.locationName);
  int spys;
  int players;
  String locationName;
  getPlayerListRandom() {
    var playerList = [];
    List pList =
        List<Player>.generate(players, (index) => PlayerFromlist(locationName));
    List sList = List<Player>.generate(spys, (index) => PlayerFromlistSpy());
    playerList = pList + sList;
    playerList.shuffle();
    return playerList;
  }
}
