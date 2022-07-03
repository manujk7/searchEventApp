import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_application/view/widgets/searchAppBarWidget.dart';
import 'package:search_application/view_model/controller/mainController.dart';
import 'package:intl/intl.dart';

import '../../appPages.dart';

class SearchListingScreen extends StatefulWidget {
  const SearchListingScreen({Key key}) : super(key: key);

  @override
  _SearchListingScreenState createState() => _SearchListingScreenState();
}

class _SearchListingScreenState extends State<SearchListingScreen> {
  MainController mainController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: mainController.showSearchBar.value
            ? SearchAppBar(
                appBar: AppBar(toolbarHeight: 64),
              )
            : AppBar(
                title: const Text('Events Search'),
                automaticallyImplyLeading: false,
                toolbarHeight: 64,
                elevation: 0,
                backgroundColor: mainController.bgColor,
                actions: [
                  // Navigate to the Search Screen
                  IconButton(
                    onPressed: () {
                      mainController.showSearchBar.value =
                          !mainController.showSearchBar.value;
                    },
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
        body: mainController.eventListingModel != null &&
                mainController.eventListingModel.value != null &&
                mainController.eventListingModel.value.events != null &&
                mainController.eventListingModel.value.events.isNotEmpty
            ? Container(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount:
                        mainController.eventListingModel.value.events.length,
                    itemBuilder: (context, index) {
                      var item =
                          mainController.eventListingModel.value.events[index];
                      return Card(
                        elevation: 0,
                        child: ListTile(
                          onTap: () {

                            Get.toNamed(Routes.detailsScreen,
                                arguments: item.id);
                            mainController.currentIndex = index;
                          },
                          title: Text(
                            item.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 16),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 4, bottom: 4),
                                child: Text(
                                  item.venue != null &&
                                          item.venue.nameV2.isNotEmpty
                                      ? item.venue.nameV2
                                      : "",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                              Text(
                                item.datetimeLocal != null
                                    ? DateFormat('EEE, dd MMM yyyy')
                                        .add_jms()
                                        .format(item.datetimeLocal)
                                    : "",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          leading: Stack(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 12, right: 12),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: item.performers.isNotEmpty &&
                                          item.performers[0].image.isNotEmpty
                                      ? Image.network(
                                          item.performers[0].image,
                                          fit: BoxFit.fill,
                                        )
                                      : Image.asset(
                                          "assets/images/eventSearch.png"),
                                ),
                              ),
                              item.isFavourite != null && item.isFavourite
                                  ? Positioned(
                                      left: -2,
                                      top: -2,
                                      child: Image.asset(
                                        "assets/images/heartFilled.png",
                                        height: 24,
                                        width: 24,
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            : Container(
                alignment: Alignment.center,
                child: const Text(
                  "Please type to search for an event",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
              ),
      ),
    );
  }
}
