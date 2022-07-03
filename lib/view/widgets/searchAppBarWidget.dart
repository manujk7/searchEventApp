import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_model/controller/mainController.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {

  final AppBar appBar;
  const SearchAppBar({Key key, @required this.appBar}) : super(key: key);

  @override
  _SearchAppBarState createState() => _SearchAppBarState();

  @override

  Size get preferredSize =>  Size.fromHeight(appBar.preferredSize.height);
}

class _SearchAppBarState extends State<SearchAppBar> {
  MainController mainController = Get.find();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // The search area here
      automaticallyImplyLeading: false,
      toolbarHeight: 64,
      elevation: 0,
      backgroundColor: mainController.bgColor,

      title: Row(
        children: [
          Expanded(
            child: Container(
              width: Get.width,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: mainController.searchFieldEditingController,
                decoration: InputDecoration(
                  fillColor: mainController.textFieldBgColor,
                  filled: true,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  suffixIcon: mainController
                          .searchTextFieldValue.value.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, color: Colors.white),
                          onPressed: () {
                            mainController.searchFieldEditingController.text =
                                "";
                            mainController.searchTextFieldValue.value = "";
                          },
                        )
                      : null,
                  hintText: 'Search...',
                  hintStyle: const TextStyle(color: Colors.white),
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: mainController.textFieldBgColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: mainController.textFieldBgColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onChanged: (queryParam) {
                  mainController.getSearchResults(queryParam);
                },
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          GestureDetector(
            onTap: () {
              mainController.showSearchBar.value =
                  !mainController.showSearchBar.value;
            },
            child: const Text("Cancel",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
          )
        ],
      ),
    );
  }


}
