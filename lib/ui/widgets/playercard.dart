import 'package:flutter/material.dart';
import 'package:spygame/data/consts/const.dart';
import 'package:spygame/ui/myhomepage.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard(
      {Key key,
      this.text,
      this.imgUrl,
      this.count,
      this.minusFunc,
      this.plusFunc})
      : super(key: key);
  final String text;
  final String imgUrl;
  final Function minusFunc;
  final Function plusFunc;
  final String count;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Container(
          height: SizeConfig.blockSizeVertical * 25,
          width: SizeConfig.blockSizeHorizontal * 80,
          child: Container(
            child: Stack(
              children: [
                Positioned(
                  bottom: -SizeConfig.blockSizeVertical * 5,
                  left: -SizeConfig.blockSizeVertical * 5,
                  child: CircleAvatar(
                    foregroundImage: AssetImage(imgUrl),
                    radius: SizeConfig.blockSizeVertical * 15,
                    // minRadius: 100,
                    // maxRadius: 100,
                  ),
                ),
                Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: MyTextMain(
                              text: text,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius:
                                    BorderRadius.circular(kborderRadiusCard)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconForCount(
                                  icon: Icons.keyboard_arrow_up,
                                  myFunc: plusFunc,
                                ),
                                MyTextH1text(text: count),
                                IconForCount(
                                  myFunc: minusFunc,
                                  icon: Icons.keyboard_arrow_down,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
