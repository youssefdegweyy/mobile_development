class MainMenuItemClass {
  int id = 0;
  int categoryId = 0;
  String name = "";
  String imagePath = "";
  bool isActive = false;

  MainMenuItemClass(int iId, int iCategoryId, String iName, String iImagePath,
      bool iIsActive) {
    this.id = iId;
    this.categoryId = iCategoryId;
    this.name = iName;
    this.imagePath = iImagePath;
    this.isActive = iIsActive;
  }

  bool setId(int iId) {
    this.id = iId;
    return true;
  }

  bool setCategoryId(int iCategoryId) {
    this.categoryId = iCategoryId;
    return true;
  }

  bool setName(String iName) {
    this.name = iName;
    return true;
  }

  bool setImagePath(String iImagePath) {
    this.imagePath = iImagePath;
    return true;
  }

  bool setIsActive(bool iIsActive) {
    this.isActive = iIsActive;
    return true;
  }

  int getId() {
    return id;
  }

  int getCategoryId() {
    return categoryId;
  }

  String getName() {
    return name;
  }

  String getImagePath() {
    return imagePath;
  }

  bool getIsActive() {
    return isActive;
  }
}
