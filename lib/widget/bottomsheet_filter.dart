import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dropdown.dart';
import 'input.dart';

class BottomSheetFilter extends StatefulWidget {
  const BottomSheetFilter({super.key, required this.loadData});

  final Function(String search, String category, String state, String zipcode,
      String city) loadData;

  @override
  State<BottomSheetFilter> createState() => _BottomSheetFilterState();
}

class _BottomSheetFilterState extends State<BottomSheetFilter> {
  TextEditingController searchController = TextEditingController();
  String category = "";
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      width: Get.width,
      height: 450,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Search",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Input(
            label: "Search",
            hint: "Search by anything",
            prefixIcon: Icons.search,
            controller: searchController,
          ),
          const SizedBox(
            height: 10,
          ),
          DropDown(
            setValue: (String value) {
              setState(() {
                category = value;
              });
            },
            prefixIcon: Icons.category,
            label: "Select an category",
            hint: "Select an category",
            options: const [
              {'value': '', 'label': 'Select an category'},
              {'value': '1', 'label': 'Faith Based/Church'},
              {'value': '2', 'label': 'Community Organization'},
              {'value': '3', 'label': 'Association'},
              {'value': '4', 'label': 'Government Agency'},
              {'value': '5', 'label': 'Business'},
              {'value': '6', 'label': 'Foundation'},
              {'value': '7', 'label': 'Other'}
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Input(
            label: "City",
            hint: "Enter your city",
            prefixIcon: Icons.location_city,
            controller: cityController,
          ),
          const SizedBox(
            height: 10,
          ),
          Input(
            label: "State",
            hint: "Enter your state",
            prefixIcon: Icons.location_city,
            controller: stateController,
          ),
          const SizedBox(
            height: 10,
          ),
          Input(
            label: "Zipcode",
            hint: "Enter zipcode of your area",
            prefixIcon: Icons.numbers,
            controller: zipCodeController,
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () async {
                    Get.back();
                    widget.loadData(
                        searchController.text,
                        category,
                        stateController.text,
                        zipCodeController.text,
                        cityController.text);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.blue,
                          Color(0xff2447bb),
                        ],
                      ),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                            offset: Offset(0.1, 1.0))
                      ],
                    ),
                    child: const Text(
                      "Search",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    widget.loadData("", "", "", "", "");
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                            offset: Offset(0.1, 1.0))
                      ],
                    ),
                    child: const Text(
                      "Reset",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
