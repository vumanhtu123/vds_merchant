import 'package:vds/common/api_const.dart';

class UserNotificationsRequest {
  int? size;
  int? page;

  UserNotificationsRequest({
    this.size,
    required this.page,
  });

  Map<String, dynamic> toMap() {
    return {
      "size": (size ?? ApiConst.size).toString(),
      "page": page.toString(),
    };
  }

  String toApi() => ApiConst.notification;
}
