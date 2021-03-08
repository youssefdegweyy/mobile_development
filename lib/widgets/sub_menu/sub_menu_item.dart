import 'package:mycart/models/sub_menu/sub_menu_item.dart';
import 'package:mycart/screens/item.dart';
import 'package:mycart/services/data_manager.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

Widget subMenuItem(BuildContext mContext, SubMenuItemClass mItem) {
  bool isDiscount = (mItem.discount != 0);
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
                return ItemScreen(mItem);
              },
            ),
          );
        },
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FadeInImage(
                        image: NetworkImage(
                          DataManager.subMenuImagePath + mItem.getImagePath(),
                        ),
                        placeholder: AssetImage(
                          "assets/images/holders/sub_menu_item_holder.png",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: AutoSizeText(
                          mItem.name,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Text(
                          mItem.description.length > 30
                              ? mItem.description.substring(0, 30) + "..."
                              : mItem.description,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Column(
                        children: [
                          isDiscount
                              ? Row(
                                  children: [
                                    Text(
                                      mItem.price.toString(),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      'EGP',
                                      style: TextStyle(
                                        fontSize: 8,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox(
                                  height: 12,
                                ),
                          Row(
                            children: [
                              Text(
                                (isDiscount
                                        ? mItem.getFinalPrice()
                                        : mItem.price)
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF00af87),
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                'EGP',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF00af87),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                isDiscount
                    ? FractionallySizedBox(
                        widthFactor: 0.5,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xFFd86464),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: AutoSizeText(
                              mItem.discount.toString() + '% OFF',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 12,
                    right: 12,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF00d466),
                        Color(0xFF00af87),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: Text(
                    '+',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 33,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
