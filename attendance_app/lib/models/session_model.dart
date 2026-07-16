class SessionModel {
  final String courseCode;
  final String roomNumber;
  final DateTime startTime;
  final bool isActive;

  SessionModel({
    required this.courseCode,
    required this.roomNumber,
    required this.startTime,
    required this.isActive,
  });
}