import 'dart:convert';

import "package:http/http.dart" as http;

class RequestResult
{
  dynamic data;
  RequestResult( this.data);
}

const PROTOCOL = "http";
const DOMAIN = "easy-tution.herokuapp.com";

Future<RequestResult> http_get(String route, [dynamic data]) async
{
  var dataStr = jsonEncode(data);
  var url = "$PROTOCOL://$DOMAIN/$route?data=$dataStr";
  var result = await http.get(url);
  return RequestResult(jsonDecode(result.body));
}
Future<RequestResult> http_post(String route, [dynamic data]) async
{
  var url = "$PROTOCOL://$DOMAIN/$route";
  var dataStr = jsonEncode(data);
  var result = await http.post(url, body: dataStr, headers:{"Content-Type":"application/json"});
  return RequestResult( jsonDecode(result.body));
}