import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vds/base/translation/localization_service.dart';
import 'package:vds/base/translation/translation.dart';
import 'package:vds/common/storage_data.dart';

class BottomSheetChangeLanguage extends StatelessWidget {
  const BottomSheetChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    var list = SupportLanguage.values.where((element) {
      return element.locale !=
          '${Get.locale?.languageCode}_${Get.locale?.countryCode}';
    }).toList();
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 20 * (SupportLanguage.values.length - 1) + 10,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              var locale = list[index];
              return GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () async {
                  StorageData.instance.setCurrentLanguage(locale.languageCode);
                  LocalizationService().changeLocale(locale.languageCode);
                  Get.back();
                  Get.snackbar(
                    "Change language".tr,
                    "Successful language change".tr,
                    backgroundColor: Colors.white,
                  );
                },
                child: Row(
                  children: [
                    locale.flag,
                    const SizedBox(
                      width: 10,
                    ),
                    Text(locale.text),
                  ],
                ),
              );
            },
            itemCount: SupportLanguage.values.length - 1,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                thickness: 1,
                height: 30,
              );
            },
          ),
        ),
      ),
    );
  }
}
