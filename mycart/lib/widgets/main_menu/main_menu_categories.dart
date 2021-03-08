import 'package:mycart/models/main_menu/main_menu_category.dart';
import 'package:mycart/services/data_manager.dart';
import 'package:mycart/widgets/main_menu/main_menu_items.dart';
import 'package:flutter/material.dart';

Widget mainMenuCategories(BuildContext mContext) {
  return Column(
    children: [
      for (MainMenuCategoryClass i in DataManager.mainMenuCategories)
        Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                i.getName(),
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            mainMenuItems(mContext, i.getId()),
          ],
        ),
    ],
  );
}
