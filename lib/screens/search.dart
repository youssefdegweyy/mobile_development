import 'package:mycart/services/data_manager.dart';
import 'package:mycart/widgets/search/last_search_keywords.dart';
import 'package:mycart/widgets/search/search_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SearchScreen extends StatefulWidget {
  static const appBarTitle = 'Home';
  static const routeName = '/main-menu';

  @override
  SearchScreenState createState() {
    return SearchScreenState();
  }
}

class SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  bool isSearchMode = false;
  bool isLoading = false;

  void setCurrentSearch(String searchKey) {
    searchController.text = searchKey;
    searchController.selection = TextSelection.fromPosition(
      TextPosition(offset: searchController.text.length),
    );
    toggleIsSearching(searchKey);
  }

  void _clearSearch() {
    searchController.clear();
    toggleIsSearching(searchController.text);
  }

  bool toggleIsSearching(String value) {
    if (value.isEmpty) {
      if (isSearchMode) {
        setState(() {
          isSearchMode = false;
          isLoading = false;
        });
      }
    } else {
      if (!isSearchMode) {
        isSearchMode = true;
      }
      isLoading = true;
      setState(() {});
      iniSearchItems();
    }
    return true;
  }

  Future<void> iniSearchItems() async {
    await DataManager.iniSearchItems(searchController.text);
    setState(() {
      isLoading = false;
    });
  }

  Future<void> addToLastSearchKeywords() async {
    if (searchController.text != "") {
      bool isFound = false;
      for (String i in DataManager.lastSearchKeywords) {
        if (i == searchController.text) {
          isFound = true;
        }
      }
      if (!isFound) {
        DataManager.lastSearchKeywords.add(searchController.text);
      }
    }
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 65,
        automaticallyImplyLeading: false,
        leadingWidth: 80,
        actions: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 5),
              child: TextFormField(
                autofocus: true,
                controller: searchController,
                onChanged: toggleIsSearching,
                onEditingComplete: addToLastSearchKeywords,
                decoration: new InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  hintText: 'Search',
                  hintStyle: new TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                  suffixIcon: isSearchMode
                      ? InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: _clearSearch,
                          child: Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.clear,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      : SizedBox(),
                ),
              ),
            ),
          ),
        ],
      ),
      body: !isLoading
          ? Container(
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? Color(0xFF2E2E2E)
                      : Colors.white,
              child: ListView(
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          top: 22, left: 30, right: 30, bottom: 22),
                      child: !isSearchMode
                          ? Column(
                              children: [
                                /*Row(
                                  children: [
                                    RaisedButton(
                                      color: Color(0xFFc9f6df),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      padding: const EdgeInsets.only(
                                          top: 11.0,
                                          bottom: 11,
                                          left: 17,
                                          right: 17),
                                      child: Text(
                                        'Breakfast Toast',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () {
                                        setCurrentSearch("Breakfast Toast");
                                      },
                                    ),
                                    SizedBox(
                                      width: 13,
                                    ),
                                    RaisedButton(
                                      color: Color(0xFFc9f6df),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      padding: const EdgeInsets.only(
                                          top: 11.0,
                                          bottom: 11,
                                          left: 17,
                                          right: 17),
                                      child: Text(
                                        'Greek Yogurt',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () {
                                        setCurrentSearch("Greek Yogurt");
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    RaisedButton(
                                      color: Color(0xFFc9f6df),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      padding: const EdgeInsets.only(
                                          top: 11.0,
                                          bottom: 11,
                                          left: 17,
                                          right: 17),
                                      child: Text(
                                        'Cookies',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () {
                                        setCurrentSearch("Cookies");
                                      },
                                    ),
                                    SizedBox(
                                      width: 13,
                                    ),
                                    RaisedButton(
                                      color: Color(0xFFc9f6df),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      padding: const EdgeInsets.only(
                                          top: 11.0,
                                          bottom: 11,
                                          left: 17,
                                          right: 17),
                                      child: Text(
                                        'Fresh Juices',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () {
                                        setCurrentSearch("Fresh Juices");
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    RaisedButton(
                                      color: Color(0xFFc9f6df),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      padding: const EdgeInsets.only(
                                          top: 11.0,
                                          bottom: 11,
                                          left: 17,
                                          right: 17),
                                      child: Text(
                                        'Healthy Smoothies',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () {
                                        setCurrentSearch("Healthy Smoothies");
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),*/
                                lastSearchKeywords(context, setCurrentSearch),
                              ],
                            )
                          : searchItems(context)),
                ],
              ),
            )
          : Container(
              alignment: Alignment.center,
              child: SpinKitSquareCircle(
                color: Color(0xFF00af87),
                size: 20,
              ),
            ),
    );
  }
}
