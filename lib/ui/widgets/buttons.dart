import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spyprj1/data/enums.dart';
import 'package:spyprj1/getx/globalvar.dart';
import 'package:spyprj1/ui/myhomepage.dart';
import 'package:easy_localization/easy_localization.dart' as localization;
import 'package:spyprj1/ui/showcard.dart';

class StartWithYourLocationButton extends StatefulWidget {
  const StartWithYourLocationButton({
    this.value,
    Key key,
  }) : super(key: key);
  final GlobalVariable value;

  @override
  _StartWithYourLocationButtonState createState() =>
      _StartWithYourLocationButtonState();
}

class _StartWithYourLocationButtonState
    extends State<StartWithYourLocationButton> {
  final textEditingController = TextEditingController();

  @override
  void initState() {
    textEditingController.addListener(() {
      widget.value.fromMyField(textEditingController.text);
    });
    super.initState();
  }

  final GameType type = GameType.playerInput;
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  bool sub = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.blockSizeHorizontal * 80,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.amber,
      ),
      child: Column(
        children: [
          Container(
            child: TextField(
              minLines: 1,
              decoration: InputDecoration(
                hintStyle:
                    TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4),
                hintText: localization.tr("yourLocation"),
                suffixIcon: Icon(
                  Icons.location_city,
                ),
              ),
              controller: textEditingController,
              onSubmitted: (i) {
                i != null
                    ? setState(() {
                        sub = true;
                      })
                    : print("err");
              },
            ),
          ),
          Visibility(
            visible: sub,
            child: StartButton(
              onTapVoid: () {
                GlobalVariable _g = Get.find();
                _g.getPlayerList(textEditingController.text);
                Get.to(() => MyShowCardPage());
                sub = false;
              },
              text: "start",
            ),
          ),
        ],
      ),
    );
  }
}
