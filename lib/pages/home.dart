import 'package:flutter/material.dart';
import 'package:spacex/helpers/ui_icon.dart';
import 'package:spacex/helpers/ui_scale.dart';
import 'package:spacex/helpers/ui_text.dart';
import 'package:spacex/models/launch.dart';
import 'package:spacex/models/rocket.dart';
import 'package:spacex/widgets/custom_tabs.dart';
import 'package:spacex/widgets/launch_event.dart';
import 'package:spacex/widgets/rocket_tile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabIndex = 0;
  bool unmount = true;
  PageController _pageController = PageController(initialPage: 0);
  void onLaunchEventTileTap() => setState(() => unmount = true);
  void onLaunchPagePop() => setState(() => unmount = false);
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() => unmount = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    UIScale.init(context);
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: unmount == false ? 1.0 : 0.0,
                curve: Curves.easeInOutCubic,
                child: SafeArea(
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
                              onTap: () {},
                              child: Container(
                                  color: Colors.transparent,
                                  height: double.infinity,
                                  width: UIScale.width(20),
                                  alignment: Alignment.centerLeft,
                                  child: UIIcon.menu(size: UIScale.width(8))),
                            ),
                            Expanded(
                                child: GestureDetector(
                              onTap: () {},
                              child: Center(
                                  child: UIText(
                                'SpaceX',
                                fontSize: UIScale.width(5),
                                fontWeight: FontWeight.w600,
                              )),
                            )),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                color: Colors.transparent,
                                height: double.infinity,
                                width: UIScale.width(20),
                                alignment: Alignment.centerRight,
                                child: UIIcon.search(size: UIScale.width(8)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              bottom: unmount == false ? 0 : -UIScale.height(100),
              curve: Curves.easeInOutCubic,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: UIScale.height(85),
                  width: UIScale.width(100),
                  padding: EdgeInsets.only(top: UIScale.width(10)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(UIScale.width(10)), topRight: Radius.circular(UIScale.width(10))),
                  ),
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: UIScale.width(5)),
                          child: CustomTabs(
                            index: tabIndex,
                            onChange: (i) {
                              _pageController.animateToPage(i,
                                  duration: Duration(milliseconds: 250), curve: Curves.easeInOutCubic);
                            },
                          )),
                      SizedBox(height: UIScale.width(3)),
                      Expanded(
                          child: Container(
                        child: PageView(
                          controller: _pageController,
                          onPageChanged: (page) => setState(() => tabIndex = page),
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: UIScale.width(5),
                                right: UIScale.width(5),
                              ),
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LaunchEventTile(
                                    onTap: onLaunchEventTileTap,
                                    onPop: onLaunchPagePop,
                                    launch: Launch(
                                        mission: "Starlink 2",
                                        site: "CCAES SLC 40",
                                        timestamp: DateTime(2014, 12, 16),
                                        patchPath: "assets/patches/crs-patch.png"),
                                  ),
                                  SizedBox(height: UIScale.width(10)),
                                  UIText(
                                    'LAUNCH DATE',
                                    fontSize: UIScale.width(3),
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffFF003D),
                                  ),
                                  SizedBox(height: UIScale.width(2)),
                                  UIText(
                                    'Thu Oct 17 5:30:00 2019',
                                    fontSize: UIScale.width(4.5),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
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
                                    'Cape Canaveral Air Force Station Space Launch Complex 40',
                                    fontSize: UIScale.width(4.5),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: UIScale.width(8)),
                                  UIText(
                                    'COUNT DOWN',
                                    fontSize: UIScale.width(3),
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffFF003D),
                                  ),
                                  SizedBox(height: UIScale.width(2)),
                                  UIText(
                                    '5 Hrs 30mins more...',
                                    fontSize: UIScale.width(4.5),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: UIScale.width(5), right: UIScale.width(5)),
                              child: ListView(
                                padding: EdgeInsets.zero,
                                children: [
                                  LaunchEventTile(
                                    onTap: onLaunchEventTileTap,
                                    onPop: onLaunchPagePop,
                                    launch: Launch(
                                        mission: "Starlink 2",
                                        site: "CCAES SLC 40",
                                        timestamp: DateTime(2014, 12, 16),
                                        patchPath: "assets/patches/falconsat01-patch.png"),
                                  ),
                                  LaunchEventTile(
                                    onTap: onLaunchEventTileTap,
                                    onPop: onLaunchPagePop,
                                    launch: Launch(
                                        mission: "DemoSat",
                                        site: "AAAES SLC 40",
                                        timestamp: DateTime(2018, 7, 6),
                                        patchPath: "assets/patches/falcon9-patch.png"),
                                  ),
                                  LaunchEventTile(
                                    onTap: onLaunchEventTileTap,
                                    onPop: onLaunchPagePop,
                                    launch: Launch(
                                        mission: "Falcon 9 Test",
                                        site: "CCAES SEC 40",
                                        timestamp: DateTime(2019, 3, 18),
                                        patchPath: "assets/patches/demosat02-patch.png"),
                                  ),
                                  LaunchEventTile(
                                    onTap: onLaunchEventTileTap,
                                    onPop: onLaunchPagePop,
                                    launch: Launch(
                                        mission: "CRS - 2",
                                        site: "CAAES SLC 40",
                                        timestamp: DateTime(2019, 12, 18),
                                        patchPath: "assets/patches/crs-patch.png"),
                                  ),
                                  LaunchEventTile(
                                    onTap: onLaunchEventTileTap,
                                    onPop: onLaunchPagePop,
                                    launch: Launch(
                                        mission: "CRS - 6",
                                        site: "CDDES SLC 42",
                                        timestamp: DateTime(2015, 5, 7),
                                        patchPath: "assets/patches/crs6-patch.png"),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: UIScale.width(5), right: UIScale.width(5)),
                              child: ListView(
                                padding: EdgeInsets.zero,
                                children: [
                                  RocketTile(
                                    rocket: Rocket(
                                        title: "Falcon 1",
                                        status: RocketSatus.inactive,
                                        patchPath: "assets/patches/falconsat01-patch.png"),
                                  ),
                                  RocketTile(
                                    rocket: Rocket(
                                        title: "Falcon 9",
                                        status: RocketSatus.active,
                                        patchPath: "assets/patches/falcon09-patch.png"),
                                  ),
                                  RocketTile(
                                    rocket: Rocket(
                                        title: "Big Falcon Rocket",
                                        status: RocketSatus.inactive,
                                        patchPath: "assets/patches/demosat02-patch.png"),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
