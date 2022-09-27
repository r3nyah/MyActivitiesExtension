class Activity{
  final String id;
  final ActivityType type;
  final double distance;
  final DateTime when;
  final String place;

  Activity({
    required this.type,
    required this.distance,
    required this.id,
    required this.place,
    required this.when,
});
}

enum ActivityType{
  running,
  walking,
  climbing,
  swimming,
  doxing,
}

extension ActivityTypeExt on ActivityType{
  String get name{
    return toString().split(".").last;
  }
}