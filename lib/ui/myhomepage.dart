import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:spygame/bloc/cubit/gametype_cubit.dart';
import 'package:spygame/bloc/gamesettings_bloc/cubit/game_settings_cubit.dart';
import 'package:spygame/bloc/location_name/cubit/location_cubit.dart';
import 'package:spygame/data/consts/const.dart';
import 'package:easy_localization/easy_localization.dart' as localization;
import 'package:spygame/ui/showcard.dart';
import 'package:spygame/ui/startscreen.dart';
import 'package:spygame/ui/timerpage.dart';
import 'package:spygame/ui/widgets/playercard.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<GameSettingsCubit>(
          create: (_) => GameSettingsCubit(),
        ),
        BlocProvider<GametypeCubit>(
          create: (_) => GametypeCubit(),
        ),
        BlocProvider<LocationCubit>(
          create: (_) => LocationCubit(),
        ),
      ],
      child: BlocBuilder<GameSettingsCubit, GameSettingsState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Icon(
                  Icons.accessibility_rounded,
                  color: Colors.white,
                ),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_sharp,
                      color: Theme.of(context).hintColor,
                    ),
                    onPressed: () {
                      Get.offAll(() => StartScreen());
                    }),
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      PlayerCard(
                        minusFunc: () {
                          context.read<GameSettingsCubit>().decrementPlayer();
                        },
                        plusFunc: () {
                          context.read<GameSettingsCubit>().incrementPlayer();
                        },
                        count: state.players.toString(),
                        text: "citizen",
                        imgUrl: kplayerImage,
                      ),
                      PlayerCard(
                        count: state.spys.toString(),
                        minusFunc: () {
                          context.read<GameSettingsCubit>().decrementSpy();
                        },
                        plusFunc: () {
                          context.read<GameSettingsCubit>().incrementSpy();
                        },
                        text: "spy",
                        imgUrl: kspyImage,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: SizeConfig.blockSizeHorizontal * 95,
                          child: Column(
                            children: [
                              MyTextH1(
                                text: "gameTime",
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconForCount(
                                    myFunc: () {
                                      context
                                          .read<GameSettingsCubit>()
                                          .decrementTime();
                                    },
                                    icon: Icons.remove,
                                  ),
                                  TextButton(
                                    style: ButtonStyle(),
                                    onPressed: () {},
                                    child: MyTextH1text(
                                      text: ((state.timer).toInt()).toString(),
                                    ),
                                  ),
                                  GestureDetector(
                                    onLongPress: () {
                                      context
                                          .read<GameSettingsCubit>()
                                          .incrementTime();
                                    },
                                    child: IconForCount(
                                        icon: Icons.add,
                                        myFunc: () {
                                          context
                                              .read<GameSettingsCubit>()
                                              .incrementTime();
                                        }),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      BlocBuilder<GametypeCubit, GametypeState>(
                          builder: (context, GametypeState state) {
                        return BlocBuilder<LocationCubit, LocationState>(
                          builder: (context, locationState) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MyTextH1(
                                      text: 'yourLocation',
                                    ),
                                    CupertinoSwitch(
                                        value: state is GametypeCustom,
                                        onChanged: (v) {
                                          context
                                              .read<GametypeCubit>()
                                              .changeGameType(v);
                                        })
                                  ],
                                ),
                                if (state is GametypeCustom)
                                  Padding(
                                    padding: EdgeInsets.all(24),
                                    child: TextFormField(
                                      minLines: 1,
                                      onChanged: ((value) => context
                                          .read<LocationCubit>()
                                          .addCustomLocation(value)),
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                            fontSize:
                                                SizeConfig.blockSizeHorizontal *
                                                    4),
                                        hintText:
                                            localization.tr("yourLocation"),
                                        suffixIcon: Icon(
                                          Icons.location_city,
                                        ),
                                      ),
                                    ),
                                  ),
                                Visibility(
                                  visible: state is GametypeInitial ||
                                      locationState.location.isNotEmpty,
                                  child: StartButton(
                                    onTapVoid: () async {
                                      await Get.to(
                                        () => MyShowCardPage(
                                          context
                                              .read<GameSettingsCubit>()
                                              .state
                                              .getPlayerList(context
                                                  .read<LocationCubit>()
                                                  .state
                                                  .location),
                                        ),
                                      ).then((value) {
                                        if (value == true) {
                                          Get.to(
                                            () => CountDownTimer(
                                              context
                                                  .read<GameSettingsCubit>()
                                                  .state
                                                  .timer,
                                            ),
                                          );
                                        }
                                      });
                                    },
                                    text: state is GametypeInitial
                                        ? 'startWithRandom'
                                        : "start",
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      }),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class StartButton extends StatelessWidget {
  const StartButton({Key key, this.onTapVoid, this.text}) : super(key: key);
  final Function onTapVoid;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () => onTapVoid(),
        child: Card(
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(4),
            alignment: Alignment.center,
            width: SizeConfig.blockSizeHorizontal * 80,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyTextH1(
                text: text,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class IconForCount extends StatelessWidget {
  const IconForCount({this.icon, this.myFunc});
  final IconData icon;
  final Function myFunc;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          myFunc();
        },
        child: Icon(
          icon,
          size: SizeConfig.blockSizeVertical * 7,
        ));
  }
}

class MyTextH1text extends StatelessWidget {
  const MyTextH1text({this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: SizeConfig.blockSizeVertical * 4,
      ),
    );
  }
}

class MyTextH1 extends StatelessWidget {
  const MyTextH1({this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      localization.tr(text),
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: SizeConfig.blockSizeVertical * 3,
      ),
    );
  }
}

class MyTextH2 extends StatelessWidget {
  const MyTextH2({this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      localization.tr(text),
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: SizeConfig.blockSizeVertical * 2,
          color: Theme.of(context).colorScheme.secondary),
    );
  }
}

class MyTextH1white extends StatelessWidget {
  const MyTextH1white({this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Text(localization.tr(text),
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: SizeConfig.blockSizeVertical * 3,
              color: Colors.white,
            )),
      ),
    );
  }
}

class MyTextH2white extends StatelessWidget {
  const MyTextH2white({this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Text(localization.tr(text),
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal * 4,
              color: Colors.white,
            )),
      ),
    );
  }
}

class MyTextH2whiteCenter extends StatelessWidget {
  const MyTextH2whiteCenter({this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Text(localization.tr(text),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: SizeConfig.blockSizeVertical * 3,
              color: Colors.white,
            )),
      ),
    );
  }
}

class MyTextMain extends StatelessWidget {
  const MyTextMain({this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      localization.tr(text),
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: SizeConfig.blockSizeVertical * 5,
      ),
    );
  }
}

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}
