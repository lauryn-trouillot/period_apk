class UserInfo {
  String firstName;
  String lastName;
  int cycleLength;
  List<DateTime> periodDays;

  UserInfo({
    required this.firstName,
    required this.lastName,
    required this.cycleLength,
    required this.periodDays,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'cycleLength': cycleLength,
      'periodDays': periodDays.map((day) => day.toIso8601String()).toList(),
    };
  }

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      firstName: json['firstName'],
      lastName: json['lastName'],
      cycleLength: json['cycleLength'],
      periodDays: (json['periodDays'] as List<dynamic>)
          .map((day) => DateTime.parse(day as String))
          .toList(),
    );
  }
}
