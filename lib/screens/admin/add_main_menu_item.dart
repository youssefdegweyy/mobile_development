import 'package:flutter/material.dart';
import 'package:mycart/models/main_menu/main_menu_category.dart';
import 'package:mycart/services/data_manager.dart';

class AddMainItem extends StatefulWidget {
  static const routeName = '/addMainItem';

  @override
  _AddMainItemState createState() => _AddMainItemState();
}

class _AddMainItemState extends State<AddMainItem> {
  MainMenuCategoryClass currCateg = DataManager.mainMenuCategories[0];
  final itemNameController = TextEditingController();
  final itemImageURLController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool checkBoxValue = false;

  @override
  void dispose() {
    itemNameController.dispose();
    itemImageURLController.dispose();
    super.dispose();
  }

  void categChanged(MainMenuCategoryClass newCateg) {
    setState(() {
      currCateg = newCateg;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: AppBar(
          brightness: Brightness.dark,
          flexibleSpace: Container(
            decoration: new BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF00d466),
                  Color(0xFF00af87),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Scaffold(
        appBar: AppBar(
          toolbarHeight: 65,
          automaticallyImplyLeading: false,
          leadingWidth: 65,
          title: Text(
            "Add Main Item",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Padding(
            padding: EdgeInsets.only(left: 15, right: 9, top: 9, bottom: 9),
            child: IconButton(
              icon: Icon(Icons.add_circle_outline),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        body: Container(
          child: ListView(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.1,
              right: MediaQuery.of(context).size.width * 0.1,
              top: 30,
              bottom: 30,
            ),
            children: [
              Image(
                image: AssetImage('assets/images/cat.png'),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: MediaQuery.of(context).platformBrightness ==
                                Brightness.dark
                            ? Color(0xFF444444)
                            : Color(0xFFf0f0f0),
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                            buttonTheme: ButtonTheme.of(context).copyWith(
                          alignedDropdown: true,
                        )),
                        child: Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<MainMenuCategoryClass>(
                              onChanged: categChanged,
                              value: currCateg,
                              items:
                                  DataManager.mainMenuCategories.map((value) {
                                return DropdownMenuItem<MainMenuCategoryClass>(
                                  value: value,
                                  child: Text(
                                    value.name,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: TextFormField(
                        controller: itemNameController,
                        decoration: new InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          isDense: true,
                          hintText: 'Name',
                          hintStyle: new TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a valid name';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: TextFormField(
                        controller: itemImageURLController,
                        decoration: new InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          isDense: true,
                          hintText: 'Image URL',
                          hintStyle: new TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a valid Item image url';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: CheckboxListTile(
                          title: Text("Is Available"),
                          secondary: Icon(Icons.event_available_outlined),
                          controlAffinity: ListTileControlAffinity.platform,
                          value: checkBoxValue,
                          onChanged: (bool value) {
                            setState(() {
                              checkBoxValue = value;
                            });
                          },
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          padding: const EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xFF00d466),
                                  Color(0xFF00af87),
                                ],
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            child: Container(
                              constraints: const BoxConstraints(
                                  minWidth: 88.0, minHeight: 55),
                              alignment: Alignment.center,
                              child: Text(
                                'Add Item',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              var itemName = itemNameController.text;
                              var itemImageURL = itemImageURLController.text;
                              DataManager.addMainMenuItem(
                                currCateg.id,
                                itemName,
                                itemImageURL,
                                checkBoxValue ? 1 : 0,
                              ).then((value) => Navigator.of(context).pop());
                            }
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
