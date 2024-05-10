import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:energise_test/models/ip_info.dart';

class IpInfoService {
  Future<IpInfo> fetchIpInfo() async {
    final response = await http.get(Uri.parse('http://ip-api.com/json'));
    if (response.statusCode == 200) {
      return IpInfo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load IP info');
    }
  }
}
