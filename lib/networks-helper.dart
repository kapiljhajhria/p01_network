import 'package:http/http.dart';

class NetworkHelper {
  String url =
      "http://slowwly.robertomurray.co.uk/delay/8000/url/http://www.google.co.uk";
  Status status = Status.init;
  String responseStatusCode;
  bool userRequestedStatus=false;
  Future<void> getResponseStatus() async {
    Client client = Client();
    try {
      status=Status.inProgress;
      Response response = await client.get(url);

      responseStatusCode=response.statusCode.toString();
      print(responseStatusCode);
    } finally {
      status=Status.completed;
      client.close();
    }
  }
}

enum Status { init, inProgress, completed }
