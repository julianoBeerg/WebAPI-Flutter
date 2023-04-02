import 'package:flutter_webapi/services/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';

class JournalService {
  static const String url = 'http://10.0.0.173:3000/';
  static const String resource = 'learnhttp/';

  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  String getUrl() {
    return "$url$resource";
  }

  void register(String content) {
    client.post(Uri.parse(getUrl()), body: {'content': content});
  }

  void get() async {
    http.Response response = await client.get(Uri.parse(getUrl()));
    print(response.body);
  }
}