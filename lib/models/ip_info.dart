// json: {"status":"success","country":"Ukraine","countryCode":"UA","region":"51","regionName":"Odessa",
//"city":"Odesa","zip":"65000","lat":46.4752,"lon":30.7338,"timezone":"Europe/Kyiv",
//"isp":"Renome-Service: Joint Multimedia Cable Network","org":"","as":"AS34187 LLC Renome-Service","query":"78.26.149.230"}

class IpInfo {
  String country;
  String city;
  String ip;
  String countryCode;
  String region;
  String regionName;
  String zip;
  double lat;
  double lon;
  String timezone;
  String isp;
  String org;
  String as;
  String query;

  IpInfo({
    required this.country,
    required this.city,
    required this.ip,
    required this.countryCode,
    required this.region,
    required this.regionName,
    required this.zip,
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.isp,
    required this.org,
    required this.as,
    required this.query,
  });

  factory IpInfo.fromJson(Map<String, dynamic> json) {
    return IpInfo(
      country: json['country'],
      city: json['city'],
      ip: json['query'],
      countryCode: json['countryCode'],
      region: json['region'],
      regionName: json['regionName'],
      zip: json['zip'],
      lat: json['lat'],
      lon: json['lon'],
      timezone: json['timezone'],
      isp: json['isp'],
      org: json['org'],
      as: json['as'],
      query: json['query'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'city': city,
      'ip': ip,
      'countryCode': countryCode,
      'region': region,
      'regionName': regionName,
      'zip': zip,
      'lat': lat,
      'lon': lon,
      'timezone': timezone,
      'isp': isp,
      'org': org,
      'as': as,
      'query': query,
    };
  }
}
