import 'package:flutter/material.dart';
import 'package:spacex/helpers/ui_icon.dart';
import 'package:spacex/helpers/ui_scale.dart';
import 'package:spacex/helpers/ui_text.dart';
import 'package:spacex/models/launch.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchPage extends StatefulWidget {
  final Launch launch;
  LaunchPage({@required this.launch});
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: UIScale.width(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  bottom: false,
                  child: Container(
                    height: UIScale.height(5.6),
                    width: UIScale.width(100),
                    child: Center(
                      child: Container(
                        height: UIScale.height(5.6),
                        width: UIScale.width(90),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                  color: Colors.transparent,
                                  height: double.infinity,
                                  width: UIScale.width(20),
                                  alignment: Alignment.centerLeft,
                                  child: UIIcon.arrowBack(size: UIScale.width(8))),
                            ),
                            Expanded(child: Container()),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                color: Colors.transparent,
                                height: double.infinity,
                                width: UIScale.width(20),
                                alignment: Alignment.centerRight,
                                child: UIIcon.share(size: UIScale.width(8)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: UIScale.width(30),
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(widget.launch.patchPath), fit: BoxFit.fitHeight)),
                  ),
                ),
                SizedBox(height: UIScale.width(8)),
                UIText(
                  'ROCKET',
                  fontSize: UIScale.width(3),
                  fontWeight: FontWeight.w600,
                  color: Color(0xffFF003D),
                ),
                SizedBox(height: UIScale.width(2)),
                UIText(
                  widget.launch.rocket.title,
                  fontSize: UIScale.width(5),
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                SizedBox(height: UIScale.width(8)),
                UIText(
                  'LAUNCH DATE',
                  fontSize: UIScale.width(3),
                  fontWeight: FontWeight.w600,
                  color: Color(0xffFF003D),
                ),
                SizedBox(height: UIScale.width(2)),
                UIText(
                  '${widget.launch.timestamp.day < 10 ? "0" : ""}${widget.launch.timestamp.day}-${widget.launch.timestamp.month < 10 ? "0" : ""}${widget.launch.timestamp.month}-${widget.launch.timestamp.year}',
                  fontSize: UIScale.width(5),
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                SizedBox(height: UIScale.width(8)),
                UIText(
                  'LAUNCH SITE',
                  fontSize: UIScale.width(3),
                  fontWeight: FontWeight.w600,
                  color: Color(0xffFF003D),
                ),
                SizedBox(height: UIScale.width(2)),
                UIText(
                  widget.launch.site,
                  fontSize: UIScale.width(5),
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                SizedBox(height: UIScale.width(8)),
                UIText(
                  'DETAILS',
                  fontSize: UIScale.width(3),
                  fontWeight: FontWeight.w600,
                  color: Color(0xffFF003D),
                ),
                SizedBox(height: UIScale.width(2)),
                UIText(
                  widget.launch.details,
                  fontSize: UIScale.width(5),
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                SizedBox(height: UIScale.width(8)),
                UIText(
                  'ROCKET SUMAMARY',
                  fontSize: UIScale.width(3),
                  fontWeight: FontWeight.w600,
                  color: Color(0xffFF003D),
                ),
                SizedBox(height: UIScale.width(2)),
                UIText(
                  widget.launch.rocket.summary,
                  fontSize: UIScale.width(5),
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                SizedBox(height: UIScale.width(8)),
                UIText(
                  'TYPE',
                  fontSize: UIScale.width(3),
                  fontWeight: FontWeight.w600,
                  color: Color(0xffFF003D),
                ),
                SizedBox(height: UIScale.width(2)),
                UIText(
                  widget.launch.type,
                  fontSize: UIScale.width(5),
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                SizedBox(height: UIScale.width(8)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UIText(
                          'FIRST STAGE',
                          fontSize: UIScale.width(3),
                          fontWeight: FontWeight.w600,
                          color: Color(0xffFF003D),
                        ),
                        SizedBox(height: UIScale.width(2)),
                        UIText(
                          widget.launch.firstStage,
                          fontSize: UIScale.width(5),
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UIText(
                          'SECOND STAGE',
                          fontSize: UIScale.width(3),
                          fontWeight: FontWeight.w600,
                          color: Color(0xffFF003D),
                        ),
                        SizedBox(height: UIScale.width(2)),
                        UIText(
                          widget.launch.secondStage,
                          fontSize: UIScale.width(5),
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: UIScale.width(8)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UIText(
                          'YOUTUBE',
                          fontSize: UIScale.width(3),
                          fontWeight: FontWeight.w600,
                          color: Color(0xffFF003D),
                        ),
                        SizedBox(height: UIScale.width(3)),
                        GestureDetector(
                          onTap: () async {
                            if (await canLaunch(widget.launch.youtubeLink)) {
                              await launch(widget.launch.youtubeLink);
                            }
                          },
                          child: Container(
                            height: UIScale.width(12),
                            width: UIScale.width(25),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(UIScale.width(2)),
                            ),
                            child: Center(
                              child: UIIcon.youtube(size: UIScale.width(8)),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        UIText(
                          'REDDIT',
                          fontSize: UIScale.width(3),
                          fontWeight: FontWeight.w600,
                          color: Color(0xffFF003D),
                        ),
                        SizedBox(height: UIScale.width(3)),
                        GestureDetector(
                          onTap: () async {
                            if (await canLaunch(widget.launch.redditLink)) {
                              await launch(widget.launch.redditLink);
                            }
                          },
                          child: Container(
                            height: UIScale.width(12),
                            width: UIScale.width(25),
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(UIScale.width(2)),
                            ),
                            child: Center(
                              child: UIIcon.reddit(size: UIScale.width(8)),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: UIScale.width(8)),
                UIText(
                  'SNEAK PEAK',
                  fontSize: UIScale.width(3),
                  fontWeight: FontWeight.w600,
                  color: Color(0xffFF003D),
                ),
                SizedBox(height: UIScale.width(2)),
                Container(
                  height: UIScale.height(50),
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: UIScale.width(80),
                        height: UIScale.height(50),
                        margin: EdgeInsets.only(right: UIScale.width(5)),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(widget.launch.sneakPeakImagesPaths[0]), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(UIScale.width(2)),
                        ),
                      ),
                      Container(
                        width: UIScale.width(80),
                        height: UIScale.height(60),
                        margin: EdgeInsets.only(right: UIScale.width(5)),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(widget.launch.sneakPeakImagesPaths[1]), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(UIScale.width(2)),
                        ),
                      ),
                      Container(
                        width: UIScale.width(80),
                        height: UIScale.height(60),
                        margin: EdgeInsets.only(right: UIScale.width(5)),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(widget.launch.sneakPeakImagesPaths[2]), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(UIScale.width(2)),
                        ),
                      ),
                      Container(
                        width: UIScale.width(80),
                        height: UIScale.height(60),
                        margin: EdgeInsets.only(right: UIScale.width(5)),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(widget.launch.sneakPeakImagesPaths[3]), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(UIScale.width(2)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: UIScale.width(8)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
