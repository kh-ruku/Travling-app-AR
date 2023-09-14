enum Season {
  winter,
  spring,
  summer,
  autumn,
}

enum TripType {
  exploration,
  recovery,
  activities,
  therapy,
}

class Trip {
  final String id;
  final List<String> categories;
  final String title;
  final String imgUrl;
  final List<String> activities;
  final List<String> program;
  final int duration; // Add the 'duration' parameter here
  final Season season;
  final TripType tripType;
  final bool isInSummer;
  final bool isInWinter;
  final bool isForFamily;

  const Trip({
    required this.id,
    required this.categories,
    required this.title,
    required this.imgUrl,
    required this.activities,
    required this.program,
    required this.duration, // Add the 'duration' parameter here
    required this.season,
    required this.tripType,
    required this.isInSummer,
    required this.isInWinter,
    required this.isForFamily,
  });
}
