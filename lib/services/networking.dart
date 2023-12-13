import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url ;
const NetworkHelper({required this.url});

 Future<dynamic> getdata() async {
    var response = await http.get(Uri.parse(url));
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var decodeJson = jsonDecode(response.body) ;
      return decodeJson ;
    }
    else{
      print(response.statusCode);
    }
  }
}