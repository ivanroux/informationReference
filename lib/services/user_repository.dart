import 'dart:convert';

import 'package:http/http.dart' as http;

class UserRepository {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  set isLoading(bool b) {
    this._isLoading = b;
  }

  getDetails() async {
    final response = await http.get(url);
    final responseJson = json.decode(response.body);

    if (responseJson != null) {
      _isLoading = false;
      var users = responseJson["user"];
      return users;
    }
  }
}

final String url =
    'https://script.googleusercontent.com/macros/echo?user_content_key=UOm84kh88fLDcBxfgyk1aSyRqy1ORIp4XyksXyowMHu-vIX70ncxw4xmBAQbGcBsmmDEwWTMWKwLOpQUNykqagN_j7yjXHyIm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnD6uLUp5LUx_GYHsDpqM186qrJOxjNgLYnPb2feoVYuMERx0bBKNW74YzdEizbMkQ9pytj_A4aoE&lib=Mdw3zAyjVJJbKrUzgJvN8PgqwFLz7E46Y';
