class HttpConfig {
  static const String apiBaseURL = "http://api.eyepetizer.net/v1";
  static const String baobabBaseURL = "http://baobab.kaiyanapp.com";
  static const int timeout = 5000;
  static Map<String, dynamic> apiHeaders = {
    'x-api-key': '0530ee4341324ce2b26c23fcece80ea2',
    'User-Agent': 'EYEPETIZER/7060401 (V1813BT;android;9;zh_CN;android;7.6.400;cn-bj;vivo;36b10f9a818c4c166e14339e6026882e;WIFI;1080*2081) native/1.0',
    'X-THEFAIR-APPID': 'ahpagrcrf2p7m6rg',
    'X-THEFAIR-AUTH': 'foKK1FisgMH2yqa+Pr3dkD8FgfPu3Pq7ykKytSccThVPx9CAnSpr4kT3iGsA9F8O7PGugO9mTqNf9yaJ0EXZfjVOQ4vmBpIWvRepENHHx47RmGToL8c3dVJUkLiLjUidUn31lr/1jtTfe7XpxE9uZGXvrKJu6DyNtSRQIbdl7/YNekea97vSTkRupsPLVQcli6wMWq16WO/9kT1AkESGnSKa7LzuogRIBhKwL6TGwO99jE1AvDfbH38e5e4sxy0nq9qV79GL0uJx70gu3gHnHQ==',
    'X-THEFAIR-CID': '36b10f9a818c4c166e14339e6026882e',
    'X-THEFAIR-UA': 'EYEPETIZER/7060401 (V1813BT;android;9;zh_CN;android;7.6.400;cn-bj;vivo;36b10f9a818c4c166e14339e6026882e;WIFI;1080*2081) native/1.0',
    'Cookie': 'ky_udid=e1aced42b7014358bc3403c1e70269703be49dcb;ky_auth=;PHPSESSID=b8f59904c3a883a2de915cb080237ff5;APPID=ahpagrcrf2p7m6rg',
    'Host': 'api.eyepetizer.net'
  };

  static Map<String, dynamic> baobabHeaders = {
    'Cookie': 'ky_auth=;sdk=28',
    'model': 'Android',
    'User-Agent': 'Dalvik/2.1.0 (Linux; U; Android 9; V1813BT Build/PKQ1.181030.001)',
    'Host': 'baobab.kaiyanapp.com'
  };

  static String PHPSESSID = "";
}