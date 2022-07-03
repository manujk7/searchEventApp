import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view_model/controller/mainController.dart';
import 'package:intl/intl.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  MainController mainController = Get.find();
  int id;

  @override
  void initState() {
    super.initState();
    if (Get.arguments != null) {
      id = Get.arguments;
      mainController.getEventDetails(id.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            mainController.eventDetailModel != null &&
                    mainController.eventDetailModel.value != null
                ? mainController.eventDetailModel.value.title ?? ""
                : "",
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w900),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          automaticallyImplyLeading: true,
          toolbarHeight: 64,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.blue),
          backgroundColor: Colors.white,
          actions: [
            // Navigate to the Search Screen
            GestureDetector(
              onTap: () {
                if (id != null) {
                  mainController.makeFavourite(id.toString());
                } else {
                  Get.snackbar("Failed!!", "Id is missing");
                }
              },
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                child: Image.asset(
                  mainController.eventDetailModel != null &&
                          mainController.eventDetailModel.value != null &&
                          mainController.eventDetailModel.value.isFavourite !=
                              null &&
                          mainController.eventDetailModel.value.isFavourite
                      ? "assets/images/heartFilled.png"
                      : "assets/images/heart.png",
                  height: 24,
                  width: 24,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: const Divider()),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  width: Get.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: mainController.eventDetailModel != null &&
                            mainController.eventDetailModel.value != null &&
                            mainController.eventDetailModel.value.performers !=
                                null &&
                            mainController
                                .eventDetailModel.value.performers.isNotEmpty
                        ? Image.network(
                            mainController
                                .eventDetailModel.value.performers[0].image,
                            fit: BoxFit.fill,
                          )
                        : Center(
                            child: Image.asset(
                            "assets/images/eventSearch.png",
                            height: 150,
                            width: 150,
                          )),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mainController.eventDetailModel != null &&
                                mainController.eventDetailModel.value != null &&
                                mainController
                                        .eventDetailModel.value.datetimeLocal !=
                                    null
                            ? DateFormat('EEE, dd MMM yyyy').add_jms().format(
                                mainController
                                    .eventDetailModel.value.datetimeLocal)
                            : "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        mainController.eventDetailModel != null &&
                                mainController.eventDetailModel.value != null &&
                                mainController.eventDetailModel.value.venue !=
                                    null &&
                                mainController.eventDetailModel.value.venue
                                    .nameV2.isNotEmpty
                            ? mainController.eventDetailModel.value.venue.nameV2
                            : "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12),
                      ),
                      Text(
                        mainController.eventDetailModel != null &&
                                mainController.eventDetailModel.value != null &&
                                mainController
                                        .eventDetailModel.value.description !=
                                    null
                            ? mainController.eventDetailModel.value.description
                            : "",
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    mainController.storeStringList();
    super.dispose();
  }
}
