class MainMenuCategoryClass {
  int id = 0;
  String name = "";

  MainMenuCategoryClass(int iId, String iName) {
    this.id = iId;
    this.name = iName;
  }

  bool setId(int iId) {
    this.id = iId;
    return true;
  }

  bool setName(String iName) {
    this.name = iName;
    return true;
  }

  int getId() {
    return id;
  }

  String getName() {
    return name;
  }
}
