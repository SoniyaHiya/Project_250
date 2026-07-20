class SessionModel {
  final String sessionId;
  final String courseCode;
  final String roomNumber;
  final DateTime startTime;
  final bool isActive;

  SessionModel({
    required this.sessionId,
    required this.courseCode,
    required this.roomNumber,
    required this.startTime,
    required this.isActive,
  });
}