class SubMenuItemClass {
  int id = 0;
  String name = "";
  String description = "";
  String imagePath = "";
  double price = 0;
  int discount = 0;
  int calories = 0;
  int carbs = 0;
  int protiens = 0;
  int fats = 0;
  bool isActive = false;

  SubMenuItemClass(
    int iId,
    String iName,
    String iDescription,
    String iImagePath,
    double iPrice,
    int iDiscount,
    int iCalories,
    int iCarbs,
    int iProtiens,
    int iFats,
    bool iIsActive,
  ) {
    this.id = iId;
    this.name = iName;
    this.description = iDescription;
    this.imagePath = iImagePath;
    this.price = iPrice;
    this.discount = iDiscount;
    this.calories = iCalories;
    this.carbs = iCarbs;
    this.protiens = iProtiens;
    this.fats = iFats;
    this.isActive = iIsActive;
  }

  bool setId(int iId) {
    this.id = iId;
    return true;
  }

  bool setName(String iName) {
    this.name = iName;
    return true;
  }

  bool setDescription(String iDescription) {
    this.description = iDescription;
    return true;
  }

  bool setImagePath(String iImagePath) {
    this.imagePath = iImagePath;
    return true;
  }

  bool setPrice(double iPrice) {
    this.price = iPrice;
    return true;
  }

  bool setDiscount(int iDiscount) {
    this.discount = iDiscount;
    return true;
  }

  bool setCalories(int iCalories) {
    this.calories = iCalories;
    return true;
  }

  bool setCarbs(int iCarbs) {
    this.carbs = iCarbs;
    return true;
  }

  bool setProtiens(int iProtiens) {
    this.protiens = iProtiens;
    return true;
  }

  bool setFats(int iFats) {
    this.fats = iFats;
    return true;
  }

  bool setIsActive(bool iIsActive) {
    this.isActive = iIsActive;
    return true;
  }

  int getId() {
    return id;
  }

  String getName() {
    return name;
  }

  String getDescription() {
    return description;
  }

  String getImagePath() {
    return imagePath;
  }

  double getPrice() {
    return price;
  }

  int getDiscount() {
    return discount;
  }

  int getCalories() {
    return calories;
  }

  int getCarbs() {
    return carbs;
  }

  int getProtiens() {
    return protiens;
  }

  int getFats() {
    return fats;
  }

  bool getIsActive() {
    return isActive;
  }

  double getFinalPrice() {
    if (discount == 0) {
      return price;
    } else {
      return double.parse(
          (price - (price * (discount / 100))).toStringAsFixed(2));
    }
  }
}
