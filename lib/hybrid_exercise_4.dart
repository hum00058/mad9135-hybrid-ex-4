import 'package:http/http.dart' as http;
import 'dart:convert';

void printRandomUsers(int size) async {
  final String url = 'https://random-data-api.com/api/v2/users?size=$size';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      print('Failed to load users, status code: ${response.statusCode}');
      return;
    }

    List<dynamic> users = json.decode(response.body);
    for (var user in users) {
      print('ID: ${user['uid']}, ${user['first_name']} ${user['last_name']}');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}
