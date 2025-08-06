import 'package:coding_interview_frontend/model/network/url.dart';

class Urls {
  const Urls._();

  /// Using Mockoon to mock the requests from j6q7lg6a.execute-api.eu-west-1.amazonaws.com
  static const Url mockUrl = Url('http://192.168.15.123:3000');

  static const Url prodUrl = Url(
    'https://j6q7lg6a.execute-api.eu-west-1.amazonaws.com',
  );
}
