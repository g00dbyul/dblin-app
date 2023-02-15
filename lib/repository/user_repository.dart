import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

var client = http.Client();

findByID(String id) async {
  var response = await client.get(Uri.http('localhost:3000','users/'+ id));
  return convert.jsonDecode(response.body);
}

create(String id) async {
  var response = await client.post(Uri.http('localhost:3000','users/'+ id),);
  return convert.jsonDecode(response.body);
}