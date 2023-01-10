import 'package:adi_quiz/app/config/app_dimens.dart';
import 'package:adi_quiz/app/config/app_strings.dart';
import 'package:adi_quiz/app/config/app_styles.dart';
import 'package:adi_quiz/app/config/constants/assets_constants.dart';
import 'package:adi_quiz/presentation/get/controllers/home/home_controller.dart';
import 'package:adi_quiz/presentation/ui/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.paddingAppBodyVeryLarge),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AssetsConstants.iconLight,
                  fit: BoxFit.fill,
                  width: 80,
                  height: 80,
                ),
                Space.vLarge,
                Space.vLarge,
                Text(
                  AppStrings.titleHome,
                  style: TextStyles.labelHeader,
                ),
                Space.vMedium,
                Text(
                  AppStrings.subTitleHome,
                  style: TextStyles.labelSmall,
                ),
                Space.vLarge,
                Space.vLarge,
                Space.vMedium,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextButton(
                      style: ButtonStyles.buttonFullColor,
                      onPressed: () => controller.goToPlay(),
                      child: Text(
                        AppStrings.play.toUpperCase(),
                      ),
                    ),
                    Space.vMedium,
                    TextButton(
                      style: ButtonStyles.buttonBorder,
                      onPressed: () => controller.goToTopic(),
                      child: Text(
                        AppStrings.topics.toUpperCase(),
                      ),
                    ),
                    Space.vLarge,
                    Space.vMedium,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          overlayColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          onTap: () => controller.onShare(),
                          child: Row(
                            children: [
                              Image.asset(
                                AssetsConstants.iconShare,
                                fit: BoxFit.fill,
                                width: 20,
                                height: 20,
                              ),
                              Text(
                                AppStrings.share,
                                style: TextStyles.labelSmallIcon,
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          overlayColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          onTap: () =>controller.onReview(),
                          child: Row(
                            children: [
                              Image.asset(
                                AssetsConstants.iconStar,
                                fit: BoxFit.fill,
                                width: 18,
                                height: 18,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 3),
                                child: Text(
                                  AppStrings.rate,
                                  style: TextStyles.labelSmallIcon,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
