class ActivityResponse {
  final int id;
  final String title;
  final String description;
  final String time;
  final String location;
  final String type;
  final double cost;

  ActivityResponse({
    required this.id,

    required this.title,
    required this.description,
    required this.time,
    required this.location,
    required this.cost,
    required this.type,
  });

  factory ActivityResponse.fromJson(Map<dynamic, dynamic> json) {
    return ActivityResponse(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      time: json['time'],
      location: json['location'],
      type: json['type'],
      cost: double.parse(json['cost']),
    );
  }
}
