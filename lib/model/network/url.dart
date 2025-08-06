import 'package:coding_interview_frontend/model/network/credential.dart';

class Url {
  const Url(this.baseHost, {this.port, this.wlCredential});

  final String baseHost;
  final int? port;
  final Credential? wlCredential;

  String get host => port != null ? '$baseHost:$port' : baseHost;

  Uri get uri => Uri.parse(host);
}
