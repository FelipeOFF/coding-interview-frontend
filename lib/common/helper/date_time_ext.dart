import 'package:coding_interview_frontend/generated/l10n.dart';

extension DateTimeExt on DateTime {
  String formatDateToLess(AppS strings) {
    final now = DateTime.now();
    final difference = this.difference(now);

    if (difference.inDays > 0) {
      return strings.day(difference.inDays);
    } else if (difference.inHours > 0) {
      return strings.hour(difference.inHours);
    } else if (difference.inMinutes > 0) {
      return strings.min(difference.inMinutes);
    } else if (difference.inSeconds > 0) {
      return strings.sec(difference.inSeconds);
    } else {
      return strings.justNow;
    }
  }
}
