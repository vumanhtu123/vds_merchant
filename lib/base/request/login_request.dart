import 'package:vds/common/api_const.dart';

class LoginRequest {

  String username;
  String password;
  String? grantType;
  String? scope;

  LoginRequest({
    required this.username,
    required this.password,
    this.grantType,
    this.scope
  });

  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "password": password,
      "grant_type": grantType ?? "password",
      "scope": scope ?? "all",
    };
  }

  // FormData toFormData() {
  //   return FormData(
  //     {
  //       "username": username,
  //       "password": password,
  //       "grant_type": grantType ?? "password",
  //       "scope": scope ?? "all",
  //     }
  //   );
  // }

  String toApi() => ApiConst.logins;
}