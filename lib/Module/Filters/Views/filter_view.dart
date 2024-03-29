
import '/module/filters/components/bottom_filter_sheet.dart';
import '/utills/app_theme/AppColors.dart';
import '/module/player/views/player_view.dart';
import '/utills/customs/app_bar/my_app_bar.dart';
import '/utills/app_theme/app_config.dart';
import '/utills/voice_tile/voice_tile.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Voices {
  String callerName;
  String callDateTime;
  String callDuration;
  bool isFav;
  bool isOutgoingCall;
  Voices(
      {required this.callDateTime,
      required this.callDuration,
      required this.callerName,
      required this.isFav,
      required this.isOutgoingCall});
}

class FilterView extends StatefulWidget {
  String filterType;
  FilterView({required this.filterType, Key? key}) : super(key: key);

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  bool sortByDateTime = true;
  int delayMul = 0;
  List<Voices> listOfSelected = [];
  List<Voices> listOfVoices = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 50; i++) {
      listOfVoices.add(Voices(
        callDateTime: DateTime.now().toString(),
        callDuration: DateTime.now().hour.toString() +
            ":" +
            DateTime.now().minute.toString(),
        callerName: "Jabran Haider",
        isFav: true,
        isOutgoingCall: i % 2 == 0 ? false : true,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: CustomAppBar().searchappBar(
          context: context,
          name: "Filter",
          isBackButton: true,
          backOnPressed: () => Get.back(),
          deletePressed: () {
            setState(() {
              for (var obj in listOfSelected) {
                listOfVoices.remove(obj);
              }
            });
          },
          filterPressed: () {
            BottomFilterSheet().filter(
              context: context,
              sortByDateTime: sortByDateTime,
              sorByAtoZSortPressed: () {
                if (sortByDateTime) {
                  setState(() {
                    sortByDateTime = !sortByDateTime;
                  });

                  Get.back();
                }
              },
              sortByDateTimePressed: () {
                if (!sortByDateTime) {
                  setState(() {
                    sortByDateTime = !sortByDateTime;
                  });
                  Get.back();
                }
              },
            );
          },
        ),
        body: ListView(
          children: [
            SizedBox(
              height: AppConfig(context).height * 0.01,
            ),
            for (var i in listOfVoices)
              DelayedDisplay(
                  delay: Duration(
                      milliseconds:
                          50 * (delayMul > 3 ? ++delayMul : delayMul)),
                  child: VoiceTile().allCallsTile(
                      context: context,
                      callerName: i.callerName,
                      callDateTime: i.callDateTime,
                      callDuration: i.callDuration,
                      fromFilter: true,
                      isGoing: i.isOutgoingCall,
                      isTileSelect: listOfSelected.contains(i) ? true : false,
                      onTileSelect: (v) {
                        setState(() {
                          if (listOfSelected.contains(i)) {
                            listOfSelected.remove(i);
                          } else {
                            listOfSelected.add(i);
                          }
                        });
                      },
                      clickFavIcon: () {
                        setState(() {
                          i.isFav = !i.isFav;
                        });
                      },
                      onTapTile: () {
                        // print("grt.to Play voice note");
                        // Get.to(() => PlayerView());
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => PlayerView()));
                      },
                      ),
                      ),
            SizedBox(
              height: 20,
            )
          ],
        ));
  }
}
