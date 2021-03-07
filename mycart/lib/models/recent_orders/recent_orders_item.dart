class RecentOrdersItemClass {
  int id = 0;
  int orderId = 0;
  int itemId = 0;
  String itemName = "";
  int qty = 0;
  double itemPrice = 0;

  RecentOrdersItemClass(int iId, int iOrderId, int iItemId, String iItemName,
      int iQTY, double iItemPrice) {
    this.id = iId;
    this.orderId = iOrderId;
    this.itemId = iItemId;
    this.itemName = iItemName;
    this.qty = iQTY;
    this.itemPrice = iItemPrice;
  }

  bool setId(int iId) {
    this.id = iId;
    return true;
  }

  bool setOrderId(int iOrderId) {
    this.orderId = iOrderId;
    return true;
  }

  bool setItemId(int iItemId) {
    this.itemId = iItemId;
    return true;
  }

  bool setItemName(String iItemName) {
    this.itemName = iItemName;
    return true;
  }

  bool setQTY(int iQTY) {
    this.qty = iQTY;
    return true;
  }

  bool setItemPrice(double iItemPrice) {
    this.itemPrice = iItemPrice;
    return true;
  }

  int getId() {
    return id;
  }

  int getOrderId() {
    return orderId;
  }

  int getItemId() {
    return itemId;
  }

  String getItemName() {
    return itemName;
  }

  int getQTY() {
    return qty;
  }

  double getItemPrice() {
    return itemPrice;
  }
}
