import 'package:CareAlliances/widget/bottomsheet_filter.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utlis/location.dart';

class Search extends StatefulWidget {
  const Search(
      {super.key,
      required this.loadData,
      required this.setLoading,
      required this.reset});

  final Function(String search, String category, String state, String zipcode,
      String city) loadData;
  final Function(bool isLoading) setLoading;

  final Function reset;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();

  final LocationInfo _locationInfo = LocationInfo();

  getCurrentLocation(bool doSearch) async {
    if (await _locationInfo.handleLocationPermission()) {
      Position position = await _locationInfo.getCurrentLocation();
      _searchController.text = await _locationInfo
          .getAddressFromLatLng(LatLng(position.latitude, position.longitude));
    if (doSearch) {
      Placemark place = await _locationInfo
          .getDetailFromLatLng(LatLng(position.latitude, position.longitude));
      widget.loadData("", "", place.subLocality ?? "", place.postalCode ?? "",
          place.locality ?? "");
    }
      setState(() {});
    } else {
      print("////////// Permission Nai ha ///////////");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff035397), width: 1),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.location_on,
                              color: Color(0xff035397)),
                          onPressed: () {
                            getCurrentLocation(true);
                          },
                        ),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search",
                            ),
                            cursorColor: Colors.black,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    style: ButtonStyle(
                        elevation:
                            MaterialStateProperty.resolveWith((states) => 2),
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => const Color(0xff035397))),
                    color: Colors.white,
                    onPressed: () async {
                      widget.setLoading(true);
                      try {
                        Location position = await _locationInfo
                            .getLatLngFromAddress(_searchController.text);
                        Placemark place =
                            await _locationInfo.getDetailFromLatLng(
                                LatLng(position.latitude, position.longitude));
                        widget.loadData("", "", place.subLocality ?? "",
                            place.postalCode ?? "", place.locality ?? "");
                      } catch (e) {
                        widget.loadData(_searchController.text, "", "", "", "");
                      }
                    },
                    icon: const Icon(Icons.search),
                  ),
                  IconButton(
                    style: ButtonStyle(
                      elevation:
                          MaterialStateProperty.resolveWith((states) => 2),
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.red),
                    ),
                    color: Colors.white,
                    onPressed: () async {
                      widget.reset();
                      _searchController.text = "";
                      setState(() {});
                    },
                    icon: const Icon(Icons.close),
                  )
                ],
              ),
            ),
          ),
          IconButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.resolveWith((states) => 2),
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => const Color(0xff035397))),
            color: Colors.white,
            onPressed: () async {
              Get.bottomSheet(
                BottomSheetFilter(loadData: widget.loadData),
              );
            },
            icon: const Icon(Icons.filter_list_alt),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: Align(
          //     alignment: Alignment.centerRight,
          //     child: InkWell(
          //       onTap: () {
          //         Get.bottomSheet(
          //           BottomSheetFilter(loadData: widget.loadData),
          //         );
          //       },
          //       child: Container(
          //         width: 60,
          //         padding:
          //             const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          //         decoration: BoxDecoration(
          //           color: const Color(0xff035397),
          //           borderRadius: BorderRadius.circular(100),
          //         ),
          //         child: const Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: [
          //             Icon(
          //               Icons.filter_list_alt,
          //               color: Colors.white,
          //             ),
          //             SizedBox(
          //               width: 5,
          //             ),
          //             // Text(
          //             //   "Filter",
          //             //   style: TextStyle(
          //             //       fontWeight: FontWeight.bold, color: Colors.white),
          //             // ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
