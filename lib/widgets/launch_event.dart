import 'package:flutter/material.dart';
import 'package:spacex/helpers/ui_scale.dart';
import 'package:spacex/helpers/ui_text.dart';
import 'package:spacex/helpers/ux_route.dart';
import 'package:spacex/models/launch.dart';
import 'package:spacex/pages/launch.dart';

class LaunchEventTile extends StatelessWidget {
  final Launch launch;
  final Function onTap;
  final Function onPop;
  LaunchEventTile({@required this.launch, this.onTap, this.onPop});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap();
        Future.delayed(Duration(milliseconds: 500), () {
          Navigator.push(context, UXRoute.fade(LaunchPage(launch: launch))).then((_) => {if (onPop != null) onPop()});
        });
      },
      child: Container(
        height: UIScale.width(40),
        width: UIScale.width(90),
        margin: EdgeInsets.only(top: UIScale.width(5)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(UIScale.width(2)),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 6.3, offset: const Offset(0, 4))],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: UIScale.width(5)),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(launch.patchPath), fit: BoxFit.fitHeight)),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        UIText(
                          'LAUNCH',
                          fontSize: UIScale.width(3),
                          fontWeight: FontWeight.w600,
                          color: Color(0xffFF003D),
                        ),
                        UIText(
                          launch.mission,
                          fontSize: UIScale.width(5),
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                        UIText(
                          launch.site,
                          fontSize: UIScale.width(3),
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.53),
                        ),
                        UIText(
                          '${launch.timestamp.day < 10 ? "0" : ""}${launch.timestamp.day}-${launch.timestamp.month < 10 ? "0" : ""}${launch.timestamp.month}-${launch.timestamp.year}',
                          fontSize: UIScale.width(3),
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.53),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
