import 'package:adi_quiz/app/config/app_dimens.dart';
import 'package:adi_quiz/app/config/app_strings.dart';
import 'package:adi_quiz/app/config/app_styles.dart';
import 'package:adi_quiz/presentation/get/controllers/topic/topic_controller.dart';
import 'package:adi_quiz/presentation/ui/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/topic_item_list_view.dart';

class TopicPage extends GetView<TopicController> {
  const TopicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBarStyles.normalAppbar(
          title: AppStrings.topics,
        ),
        body: ListView.separated(
          padding: const EdgeInsets.fromLTRB(
            AppDimens.paddingAppBody,
            AppDimens.paddingAppBody,
            AppDimens.paddingAppBody,
            AppDimens.paddingAppBody,
          ),
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          separatorBuilder: (_, __) => Space.vSmall,
          itemBuilder: (context, index) {
            var data = controller.listData[index];
            return TopicItemListView(
              data: data.name,
              onTap: () => controller.goToPlay(
                data: data.id,
              ),
            );
          },
          itemCount: controller.listData.length,
        ),
      ),
    );
  }
}
