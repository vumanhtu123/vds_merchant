import 'package:get/get.dart';
import 'package:vds/model/notification.model.dart';
import 'package:vds/widget/my.scroll.controller.dart';

import '../../../../base/base_controller.dart';
import '../../../../base/request/user_notifications_request.dart';

class StaffNotificationController extends BaseController {
  late MyScrollController scrollController;
  final RxList<Content> contentNoti = <Content>[].obs;
  final onPage = 20;
  RxBool errorNetwork = false.obs;

  @override
  void onInit() {
    scrollController = MyScrollController(_loadMore);
    super.onInit();
  }

  goToDetail(NotificationModel notifcation) {}

  void _loadMore() async {
    if (contentNoti.length > 30) {
      scrollController.updateFull();
    } else {
      // var temp = await reposity.getMoreNotificationStaff();
      // notifications.addAll(temp);
      // notifications.refresh();
    }
  }

  getNotification() async {
    await getUserNotifications(UserNotificationsRequest(
      page: 0,
    )).then((value) {
      if (value.message == "Success") {
        final content = value.data?.content! ?? [];
        contentNoti.clear();
        contentNoti.addAll(content);
        // print(contentNoti);
      } else {
        errorNetwork.value = true;
      }
    });
  }

  onClickItem(Content notification) {
    notification.isSeenNotifier.value = true;
  }
}
