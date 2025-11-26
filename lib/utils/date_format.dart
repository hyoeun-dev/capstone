import 'package:intl/intl.dart';

String getFullDate(int month, int day) {
  return DateFormat('yyyy/MM/dd/E', 'ko_KR').format(DateTime(2025, month, day));
}

String getShortDate(int month, int day) {
  return DateFormat('MM/dd(E)', 'ko_KR').format(DateTime(2025, month, day));
}