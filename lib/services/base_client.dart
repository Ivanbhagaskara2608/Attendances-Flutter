import 'package:http/http.dart' as http;

const String baseUrl = 'https://0be6-180-254-122-206.ngrok-free.app/api';

class BaseClient {
  var client = http.Client();

  Future<dynamic> login(dynamic object) async {
    var url = Uri.parse('$baseUrl/user/login');
    var response = await client.post(url,
        headers: {"Content-Type": "application/json"}, body: object);

    return response;
  }

  Future<dynamic> userProfile(String token) async {
    var url = Uri.parse('$baseUrl/user/profile');
    var headers = {'Authorization': "Bearer $token"};
    var response = await client.get(url, headers: headers);

    return response;
  }
}
