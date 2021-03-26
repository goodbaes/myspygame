import 'package:get/get.dart';

class GlobalVariable extends GetxController {
  var spys = 1.obs;
  var players = 1.obs;
  var timer = 60.obs;
  incrementSpys() {
    spys.value++;
    update();
  }

  decrementSpys() {
    spys.value > 0 ? spys.value-- : spys.value;
    update();
  }

  incrementPlayer() {
    players.value++;
    update();
    update();
  }

  decrementTimer() {
    timer.value > 0 ? timer.value = timer.value - 60 : timer.value;
    update();
  }

  decrementPlayer() {
    players.value > 0 ? players.value-- : players.value;
    update();
  }

  incrementTimer() {
    timer.value = timer.value + 60;
    update();
  }
}
