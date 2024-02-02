
import 'package:http/http.dart' as http;

const String baseUrl = 'https://9264-125-165-231-107.ngrok-free.app/api';

class BaseClient {
  var client = http.Client();

  Future<dynamic> login(dynamic object) async {
    var url = Uri.parse('$baseUrl/user/login');
    var response = await client.post(url,
        headers: {"Content-Type": "application/json"}, body: object);

    return response;
  }
}
