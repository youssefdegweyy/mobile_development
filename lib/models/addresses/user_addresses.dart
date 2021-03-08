import 'package:mycart/models/addresses/delivery_locations.dart';
import 'package:mycart/services/data_manager.dart';

class UserAddressesClass {
  int id;
  int userId;
  int locationId;
  DeliveryLocationsClass locationData;
  String streetName;
  String buildingNumber;
  int floorNumber;
  int apartmentNumber;
  String phoneNumber;
  int isPhoneVerified;
  UserAddressesClass(
      this.id,
      this.userId,
      this.locationId,
      this.streetName,
      this.buildingNumber,
      this.floorNumber,
      this.apartmentNumber,
      this.phoneNumber,
      this.isPhoneVerified) {
    for (DeliveryLocationsClass i in DataManager.deliveryLocations) {
      if (i.id == this.locationId) {
        locationData = i;
      }
    }
  }
}
