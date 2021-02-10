import 'package:spacex/models/rocket.dart';

class Launch {
  String mission;
  String site;
  String patchPath;
  DateTime timestamp;
  Rocket rocket = Rocket(title: "Falcon 1", status: RocketSatus.active, summary: "Falcon 9");
  String status = "Success";
  String details = "Last launch of the original Falcon 9 v1.0 launch vehicle";
  String type = "v1.0";
  String firstStage = "Cores: 4";
  String secondStage = "Payloads: 150kg";
  String youtubeLink = "https://www.youtube.com/watch?v=wbSwFU6tY1c";
  String redditLink = "https://www.reddit.com/r/spacex/comments/lgecum/nasa_awards_spacex_contract_to_launch_initial/";
  List<String> sneakPeakImagesPaths = [
    "assets/images/sneak-peak-1.jpeg",
    "assets/images/sneak-peak-2.jpeg",
    "assets/images/sneak-peak-3.jpeg",
    "assets/images/sneak-peak-4.jpeg"
  ];

  Launch({
    this.mission,
    this.site,
    this.patchPath,
    this.timestamp,
  });
}
