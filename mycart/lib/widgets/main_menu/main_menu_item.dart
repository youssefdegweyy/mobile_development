import 'package:mycart/models/main_menu/main_menu_item.dart';
import 'package:mycart/screens/sub_menu.dart';
import 'package:mycart/services/data_manager.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

Widget mainMenuItem(BuildContext mContext, MainMenuItemClass mItem) {
  return Expanded(
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 15,
      child: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        onTap: () {
          return Navigator.push(
            mContext,
            MaterialPageRoute(
              builder: (context) {
                return SubMenuScreen(mItem.getId(), mItem.getName());
              },
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FadeInImage(
                image: NetworkImage(
                  DataManager.mainMenuImagePath + mItem.getImagePath(),
                ),
                placeholder: AssetImage(
                  "assets/images/holders/main_menu_item_holder.png",
                ),
              ),
              (mItem.getName().split(" ").first !=
                      mItem.getName().split(" ").last)
                  ? Padding(
                      padding: EdgeInsets.only(top: 7),
                      child: AutoSizeText(
                        mItem.getName().split(" ").first,
                        style: TextStyle(
                          fontSize: 13,
                        ),
                        maxLines: 1,
                      ),
                    )
                  : SizedBox(
                      height: 5,
                    ),
              Padding(
                padding: EdgeInsets.only(top: 2),
                child: AutoSizeText(
                  mItem.getName().split(" ").last,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
