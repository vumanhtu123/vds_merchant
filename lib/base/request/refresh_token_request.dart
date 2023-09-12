import 'package:vds/common/api_const.dart';

class RefreshTokenRequest {

  String refreshToken;
  String? grantType;
  String? scope;

  RefreshTokenRequest({
    required this.refreshToken,
    this.grantType,
    this.scope
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map["refresh_token"] = refreshToken;
    map["grant_type"] = grantType ?? "refresh_token";
    // map["scope"] = scope ?? "all";
    return map;
  }

  String toApi() => ApiConst.login;
}