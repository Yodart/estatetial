enum RocketSatus { active, inactive }

class Rocket {
  String title;
  RocketSatus status;
  String summary = 'A Rocket Summary';
  String patchPath;

  Rocket({
    this.title,
    this.status,
    this.summary,
    this.patchPath,
  });
}
