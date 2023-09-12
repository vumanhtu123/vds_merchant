import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vds/app/mainapp/main.app.controller.dart';
import 'package:vds/base/base_controller.dart';
import 'package:vds/base/request/user_notifications_request.dart';
import 'package:vds/common/storage_data.dart';
import 'package:vds/model/notification.model.dart';
import 'package:vds/widget/my.scroll.controller.dart';

class MerchantNotificationController extends BaseController {
  final RxList<Content> contentNoti = <Content>[].obs;
  late MyScrollController scrollController;
  final onPage = 20;
  RxBool errorNetwork = false.obs;

  @override
  void onInit() {
    scrollController = MyScrollController(_loadMore);
    getNotification();
    super.onInit();
  }

  goToDetail(NotificationModel notifcation) {}

  void _loadMore() async {
    if (contentNoti.length > 30) {
      scrollController.updateFull();
    } else {
      // var temp = await reposity.getMoreNotificationMerchant();
      // notifications.addAll(temp);
      // notifications.refresh();
    }
  }

  getNotification() async {
    await getUserNotifications(UserNotificationsRequest(
      page: 0,
    )).then((value) async {
      await openLoadingDialog();
      if (value.message == "Success") {
        final content = value.data?.content! ?? [];
        contentNoti.clear();
        contentNoti.addAll(content);
        await closeLoadingDialog();
        if (Get.isRegistered<MainAppController>() == true) {
          Get.find<MainAppController>().notifyCount.value = 0;
        }
        StorageData.instance.setNotifyCount(0);
        errorNetwork.value = false;
      } else {
        errorNetwork.value = true;
        await closeLoadingDialog();
      }
    }).catchError((error) {
      debugPrint('$error');
    }).whenComplete(() {});
  }

  onClickItem(Content? notification) {
    notification!.isSeenNotifier.value = true;
  }
}
