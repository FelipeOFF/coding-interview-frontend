import 'package:coding_interview_frontend/generated/l10n.dart';

extension DateTimeExt on DateTime {
  String formatDateToLess() {
    final now = DateTime.now();
    final difference = this.difference(now);

    if (difference.inDays > 0) {
      return AppS.current.day(difference.inDays);
    } else if (difference.inHours > 0) {
      return AppS.current.hour(difference.inHours);
    } else if (difference.inMinutes > 0) {
      return AppS.current.min(difference.inMinutes);
    } else if (difference.inSeconds > 0) {
      return AppS.current.sec(difference.inSeconds);
    } else {
      return AppS.current.justNow;
    }
  }
}
