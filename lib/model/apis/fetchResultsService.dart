import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../eventDetailModel.dart';
import '../eventListingModel.dart';

class EventListingService extends GetConnect {
  String clientId = "Mjc2NzUzNjF8MTY1NjY2Nzg1Ni4wNDEzMTk";
  String appSecret =
      "2cd674ce8972e2295fdf0037108d1667630484fb71b65dbfd4759cbec71cf56b";
  String url = "https://api.seatgeek.com/2/events";

  Future<EvenListingModel> getEventListing(String queryParam) async {
    EvenListingModel res;
    await get(url, query: {"client_id": clientId, "q": queryParam})
        .then((value) {
      if (kDebugMode) {
        print(value.bodyString);
      }
      if (value.statusCode == 200) {
        res = EvenListingModel.fromJson(value.body);
      }
    }).catchError((err) {
      if (EasyLoading.isShow) EasyLoading.dismiss();
      throw Exception(err);
    });
    if (EasyLoading.isShow) EasyLoading.dismiss();
    return res;
  }

  Future<EventDetailModel> getEventDetail(String id) async {
    EventDetailModel res;
    await get("$url/$id", query: {"client_id": clientId}).then((value) {
      if (kDebugMode) {
        print(value.bodyString);
      }
      if (value.statusCode == 200) {
        res = EventDetailModel.fromJson(value.body);
      }
    }).catchError((err) {
      if (EasyLoading.isShow) EasyLoading.dismiss();
      throw Exception(err);
    });
    if (EasyLoading.isShow) EasyLoading.dismiss();
    return res;
  }
}
