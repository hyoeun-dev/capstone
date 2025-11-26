String dateDifference({required DateTime to}) {
  DateTime from = DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  to = DateTime.utc(to.year, to.month, to.day);
  int difference = to.difference(from).inDays;
  int value = -difference;

  if (value == 0) {
    return '-DAY';
  } else if (value > 0) {
    return '+$value';
  } else {
    return '$value';
  }
}