import '/utills/app_theme/AppColors.dart';
import '/utills/app_theme/app_config.dart';
import '/utills/customs/app_text/app_text.dart';
import 'package:call_recording_app/utills/customs/textfeilds.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

class CustomAppBar {
  simpleAppBar({
    required BuildContext context,
    required String title,
    bool isBackButton = false,
    Color textColor = AppColors.appLightThemBlackColor,
    bool isCenterTitle = false,
    bool isFilter = false,
    GestureTapCallback? backOnPressed,
    GestureTapCallback? filterPressed,
    GestureTapCallback? delteIconPressed,
    GestureTapCallback? shareIconPressed,
    GestureTapCallback? favIconPressed,
    GestureTapCallback? drawerButtonPressed,
    bool isDrawer = false,
    bool isPlayer = false,
    IconData favIconData = Icons.favorite,
  }) {
    return AppBar(
      title: AppText.text(
        title,
        color: textColor,
        fontsize: AppConfig(context).width / 20,
        fontweight: FontWeight.w600,
      ),

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),

      leading: isBackButton
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: textColor,
                size: AppConfig(context).width / 17,
              ),
              splashRadius: 25,
              onPressed: backOnPressed)
          : isDrawer
              ? IconButton(
                  onPressed: drawerButtonPressed,
                  icon: Icon(
                    Icons.menu,
                    color: textColor,
                    size: AppConfig(context).width / 17,
                  ),
                  splashRadius: 25,
                )
              : SizedBox(),
      centerTitle: isCenterTitle,
      actions: [
        isFilter
            ? IconButton(
                onPressed: filterPressed,
                icon: const Icon(
                  Icons.tune,
                  color: AppColors.background,
                ),
              )
            : const SizedBox(),
        isPlayer
            ? IconButton(
                onPressed: favIconPressed,
                icon: Icon(
                  favIconData,
                  color: AppColors.background,
                ),
              )
            : const SizedBox(),
        isPlayer
            ? IconButton(
                onPressed: shareIconPressed,
                icon: const Icon(
                  Icons.share,
                  color: AppColors.background,
                ),
              )
            : const SizedBox(),
        isPlayer
            ? IconButton(
                onPressed: delteIconPressed,
                icon: const Icon(
                  Icons.delete,
                  color: AppColors.background,
                ),
              )
            : const SizedBox(),
      ],
      // centerTitle: true,
    );
  }

  searchappBar({
    required BuildContext context,
    GestureTapCallback? filterPressed,
    GestureTapCallback? deletePressed,
    String name = "Jhon Smith",
    Function? onSearchChange,
    Function? onSearch,
    bool isBackButton = false,
    Color textColor = Colors.white,
    GestureTapCallback? backOnPressed,
  }) {
    return PreferredSize(
      preferredSize: Size.fromHeight(AppConfig(context).height / 6),
      child: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )),
        backgroundColor: AppColors.primaryColor(),
        elevation: 0,
        title: AppText.text(
          name,
          fontsize: 20,
          fontweight: FontWeight.w700,
          color: textColor,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: isBackButton
            ? IconButton(
                onPressed: backOnPressed,
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: textColor,
                  size: AppConfig(context).width / 17,
                ),
                splashRadius: 25,
              )
            : SizedBox(),
        actions: [
          Container(
            padding: EdgeInsets.only(right: AppConfig(context).width / 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: IconButton(
              onPressed: deletePressed,
              icon: const Icon(
                Icons.delete,
                size: 25,
                color: AppColors.background,
              ),
            ),
          ),
        ],
        flexibleSpace: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: AppConfig(context).width / 18),
                  height: AppConfig(context).height / 6,
                  width: AppConfig(context).width,
                ),
              ],
            ),
            Positioned(
              bottom: 13,
              child: Container(
                color: Colors.transparent,
                // height: 40,
                width: AppConfig(context).width / 1.2,
                child: DelayedDisplay(
                    delay: Duration(milliseconds: 500),
                    fadeIn: true,
                    child: AppTextFeild().searchFeild(
                        context: context,
                        hintText: "Search by name or phone no",
                        onSearch: onSearch,
                        onFilterClick: filterPressed,
                        onChange: (value) {
                          onSearchChange!(value);
                        })),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
