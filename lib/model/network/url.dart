import 'package:coding_interview_frontend/model/network/credential.dart';

class Url {
  final String baseHost;
  final int? port;
  final Credential? wlCredential;

  const Url(this.baseHost, {this.port, this.wlCredential});

  String get host => port != null ? '$baseHost:$port' : baseHost;

  Uri get uri => Uri.parse(host);
}
