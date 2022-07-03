import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:search_application/model/apis/fetchResultsService.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:search_application/model/eventListingModel.dart';
import '../../model/eventDetailModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainController extends GetxController {
  RxBool gettingData = false.obs;
  RxBool gridView = false.obs;
  Color bgColor = const Color(0xFF082B41);
  Color textFieldBgColor = const Color(0xFF234457);
  TextEditingController searchFieldEditingController = TextEditingController();
  RxString searchTextFieldValue = "".obs;
  RxBool showSearchBar = false.obs;
  EventListingService eventListingService = EventListingService();
  Rx<EvenListingModel> eventListingModel = EvenListingModel().obs;
  Rx<EventDetailModel> eventDetailModel = EventDetailModel().obs;
  RxList<String> favouriteEvent = <String>[].obs;
  String favouriteEventsKey = "favouriteEvents";
  int currentIndex = -1;

  @override
  void onInit() {
    super.onInit();
    getStoredFavouriteEvents();
  }

  Future<void> getStoredFavouriteEvents() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> test = prefs.getStringList(favouriteEventsKey);
      if (test != null && test.isNotEmpty) {
        favouriteEvent.value = test;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getSearchResults(String queryParam) async {
    searchTextFieldValue.value = queryParam;
    if (!EasyLoading.isShow) {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);
    }
    eventListingModel.value =
        await eventListingService.getEventListing(queryParam);
    if (eventListingModel.value != null &&
        eventListingModel.value.events != null &&
        eventListingModel.value.events.isNotEmpty) {
      refreshList();
    }

    if (kDebugMode) {
      print("api success");
    }
  }

  void refreshList() {
    List<Event> tempEvents = <Event>[];
    for (var element in eventListingModel.value.events) {
      if (favouriteEvent.contains(element.id.toString())) {
        element.isFavourite = true;
        tempEvents.insert(0, element);
      } else {
        tempEvents.add(element);
      }
    }
    eventListingModel.value.events = tempEvents;
    eventListingModel.refresh();
  }

  Future<void> getEventDetails(String id) async {
    if (!EasyLoading.isShow) {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);
    }
    eventDetailModel.value = await eventListingService.getEventDetail(id);
    if (favouriteEvent.contains(id)) {
      try {
        eventDetailModel.value.isFavourite = true;
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
    if (kDebugMode) {
      print("api success");
    }
  }

  void makeFavourite(String id) {
    eventDetailModel.value.isFavourite = !eventDetailModel.value.isFavourite;
    if (eventDetailModel.value.isFavourite) {
      favouriteEvent.add(id);
    } else {
      if (favouriteEvent.contains(id)) {
        favouriteEvent.remove(id);
      }
    }
    eventListingModel.value.events[currentIndex].isFavourite =
        eventDetailModel.value.isFavourite;
    eventDetailModel.refresh();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void storeStringList() async {
    print("prefs started");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(favouriteEventsKey, favouriteEvent);
    print("prefs save success");
    refreshList();
  }
}
