import 'package:mycart/models/recent_orders/recent_orders_item.dart';

class RecentOrdersClass {
  int id = 0;
  double subtotal = 0;
  double deliveryFees = 0;
  String promocode = "";
  double discount = 0;
  double totalPrice = 0;
  int deliveryAddressId = 0;
  String deliveryAddressDetails = "";
  String deliveryAddressPhoneNumber = "";
  String orderNote = "";
  int status = 0;
  int time = 0;
  List items;
  int totalOrderItems = 0;

  RecentOrdersClass(
      int iId,
      double iSubtotal,
      double iDeliveryFees,
      String iPromocode,
      double iDiscount,
      double iTotalPrice,
      int iDeliveryAddressId,
      String iDeliveryAddressDetails,
      String iDeliveryAddressPhoneNumber,
      String iOrderNote,
      int iStatus,
      int iTime,
      List iItems) {
    this.id = iId;
    this.subtotal = iSubtotal;
    this.deliveryFees = iDeliveryFees;
    this.promocode = iPromocode;
    this.discount = iDiscount;
    this.totalPrice = iTotalPrice;
    this.deliveryAddressId = iDeliveryAddressId;
    this.deliveryAddressDetails = iDeliveryAddressDetails;
    this.deliveryAddressPhoneNumber = iDeliveryAddressPhoneNumber;
    this.orderNote = iOrderNote;
    this.status = iStatus;
    this.time = iTime;
    this.items = iItems;
    calculateTotalOrderItems();
  }

  bool setId(int iId) {
    this.id = iId;
    return true;
  }

  bool setSubtotal(double iSubtotal) {
    this.subtotal = iSubtotal;
    return true;
  }

  bool setDeliveryFees(double iDeliveryFees) {
    this.deliveryFees = iDeliveryFees;
    return true;
  }

  bool setPromocode(String iPromocode) {
    this.promocode = iPromocode;
    return true;
  }

  bool setDiscount(double iDiscount) {
    this.discount = iDiscount;
    return true;
  }

  bool setTotalPrice(double iTotalPrice) {
    this.totalPrice = iTotalPrice;
    return true;
  }

  bool setDeliveryAddressId(int iDeliveryAddressId) {
    this.deliveryAddressId = iDeliveryAddressId;
    return true;
  }

  bool setDeliveryAddressDetails(String iDeliveryAddressDetails) {
    this.deliveryAddressDetails = iDeliveryAddressDetails;
    return true;
  }

  bool setDeliveryAddressPhoneNumber(String iDeliveryAddressPhoneNumber) {
    this.deliveryAddressPhoneNumber = iDeliveryAddressPhoneNumber;
    return true;
  }

  bool setStatus(int iStatus) {
    this.status = iStatus;
    return true;
  }

  bool setTime(int iTime) {
    this.time = iTime;
    return true;
  }

  bool setItems(List iItems) {
    this.totalOrderItems = 0;
    this.items = iItems;
    calculateTotalOrderItems();
    return true;
  }

  int getId() {
    return id;
  }

  double getSubtotal() {
    return subtotal;
  }

  double getDeliveryFees() {
    return deliveryFees;
  }

  String getPromocode() {
    return promocode;
  }

  double getDiscount() {
    return discount;
  }

  double getTotalPrice() {
    return totalPrice;
  }

  int getDeliveryAddressId() {
    return deliveryAddressId;
  }

  String getDeliveryAddressDetails() {
    return deliveryAddressDetails;
  }

  String getDeliveryAddressPhoneNumber() {
    return deliveryAddressPhoneNumber;
  }

  int getStatus() {
    return status;
  }

  int getTime() {
    return time;
  }

  List getList() {
    return items;
  }

  bool calculateTotalOrderItems() {
    for (RecentOrdersItemClass i in items) {
      totalOrderItems += i.qty;
    }
    return true;
  }

  int getTotalOrderItems() {
    return totalOrderItems;
  }
}
