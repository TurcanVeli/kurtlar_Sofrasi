import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kurtlar/backend/lang/language_constant.dart';
import 'package:kurtlar/frontend/base/widget_base.dart';
import 'package:kurtlar/frontend/pages/DayReport_view.dart';

import '../base/color_constants.dart';
import '../components/button.dart';
import '../components/ready.dart';
import '../components/showingOtherPlayers.dart';
import '../models/users.dart';

class DaylightPage extends StatefulWidget {
  int index;
  DaylightPage(this.index);
  @override
  State<DaylightPage> createState() => _DaylightPageState();
}

class _DaylightPageState extends BaseState<DaylightPage> {
  @override
  void initState() {
    widget.index = widget.index + 1;
    print(USERS.length);
    super.initState();
  }

  bool _isMission = false;
  bool ispressed = false;
  bool ready = false; //Hazırsa görev sayfasına
  void setIspressed() {
    setState(() {
      ispressed = !ispressed;
    });
  }

  void setReady() {
    setState(() {
      ready = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        // <-- STACK AS THE SCAFFOLD PARENT
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/daylight.jpg"), // <-- BACKGROUND IMAGE
                fit: BoxFit.cover,
              ),
            ),
          ),
          Scaffold(
              backgroundColor:
                  Colors.transparent, // <-- SCAFFOLD WITH TRANSPARENT BG
              body: ready
                  ? ReadyComponent(
                      context,
                      USERS[widget.index],
                      dynamicHeight,
                      setIspressed,
                      ispressed,
                      setReady,
                     translate(context).readyformission,
                      true)
                  : ListView(
                      children: [
                        SizedBox(
                          height: dynamicHeight(0.02),
                        ),
                        Container(
                          height: dynamicHeight(0.11),
                          child: Center(
                            child: Text(
                              USERS[widget.index].GetName,
                              style: TextStyle(
                                  color: ColorConstant.instance.white,
                                  fontSize: 34),
                            ),
                          ),
                        ),
                         SizedBox(
                          height: dynamicHeight(0.01),
                        ),
                        Container(
                          height: dynamicHeight(0.11),
                          child: Center(
                            child: Text(
                              translate(context).votes_2,
                              style: TextStyle(
                                  color: ColorConstant.instance.white,
                                  fontSize: 34),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: dynamicHeight(0.1),
                        ),
                         UserShowing(dynamicHeight(0.6), USERS, false,
                          false, USERS[widget.index]),
                          

                        BottomButtonContainerContiune(
                        context: context,
                        height: dynamicHeight(0.07),
                        buttonText: translate(context).ok,
                        where: widget.index < USERS.length - 1
                            ? DaylightPage(widget.index)
                            : DayLightreport(),
                        ContainerColor: Colors.transparent)

                      ],
                    ))
        ]);
  }
}
