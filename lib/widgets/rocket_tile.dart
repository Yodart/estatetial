import 'package:flutter/material.dart';
import 'package:spacex/helpers/ui_scale.dart';
import 'package:spacex/helpers/ui_text.dart';
import 'package:spacex/models/rocket.dart';

class RocketTile extends StatelessWidget {
  final Rocket rocket;
  RocketTile({@required this.rocket});
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  decoration:
                      BoxDecoration(image: DecorationImage(image: AssetImage(rocket.patchPath), fit: BoxFit.fitHeight)),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      UIText(
                        'ROCKET',
                        fontSize: UIScale.width(3),
                        fontWeight: FontWeight.w600,
                        color: Color(0xffFF003D),
                      ),
                      UIText(
                        rocket.title,
                        fontSize: UIScale.width(5),
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                      Container(
                        height: UIScale.width(7),
                        width: UIScale.width(25),
                        decoration: BoxDecoration(
                          color: rocket.status == RocketSatus.active ? Colors.green : Colors.red,
                          borderRadius: BorderRadius.circular(UIScale.width(2)),
                        ),
                        child: Center(
                          child: UIText(
                            rocket.status == RocketSatus.active ? "ACTIVE" : "INACTIVE",
                            fontSize: UIScale.width(3),
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
