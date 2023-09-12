import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vds/asset/Image.asset.dart';
import 'package:vds/helper/convert.dart';
import 'package:vds/model/notification.model.dart';
import '../merchant/merchant.notification.controller.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationList extends GetView<MerchantNotificationController> {
  final List<Content> notifications;
  final Function(Content content) onClickItem;

  const NotificationList(this.notifications,
      {super.key, required this.onClickItem});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => controller.getNotification(),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          var notification = notifications[index];
          return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => onClickItem(notification),
              child: ChildNotification(notification: notification));
        },
        itemCount: notifications.length,
      ),
    );
  }
}

class ChildNotification extends StatelessWidget {
  ChildNotification({
    Key? key,
    required this.notification,
  }) : super(key: key);

  final Content notification;
  final ValueNotifier<bool> _counter = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    // debugPrint(notification.createAt);
    return Column(
      children: [
        ValueListenableBuilder(
            valueListenable: _counter,
            builder: (context, isSeen, child) {
              return Container(
                color: _counter.value == true
                    ? const Color(0xFFF6F7FB)
                    : Colors.white,
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 17,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(ImageAsset.iconNotification),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: "${'Bạn vừa nhận được'.tr} ",
                              children: [
                                SpanHighlight(
                                  text: notification.title ?? '',
                                ),
                                TextSpan(
                                  text: " ${'for order payment'.tr} ",
                                ),
                                SpanHighlight(
                                  text: "\n${notification.content!}",
                                ),
                                TextSpan(
                                  text: " ${'của'.tr} ",
                                ),
                                SpanHighlight(
                                  text: Convert.stringToDatePayment(
                                    notification.createAt ?? '',
                                  ),
                                ),
                              ],
                            ),
                            style: const TextStyle(color: Colors.black),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            timeago.format(
                              Convert.stringToDate(
                                notification.createAt ?? "",
                                pattern: "yyyy-MM-dd'T'HH:mm:ss.SSS"
                              ),
                            ),
                            style: const TextStyle(
                              fontSize: 10, color: Color(0xFF747475),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
        const Divider(
          height: 1,
          thickness: 1,
          color: Color(0xFFDFE0EB),
        )
      ],
    );
  }
}

class SpanHighlight extends TextSpan {
  const SpanHighlight({super.text})
      : super(
            style: const TextStyle(
                color: Color(0xFFF89E19), fontWeight: FontWeight.w600));
}
