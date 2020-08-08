extension DateTimeUtils on DateTime {
  DateTime get dayTime => DateTime(year, month, day);

  bool isSameDay(DateTime other) =>
      year == other.year && month == other.month && day == other.day;

  bool isSameYear(DateTime other) => year == other.year;

  String get dateString => '$year/$month/$day';
}
