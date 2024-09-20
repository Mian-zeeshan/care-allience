import 'package:CareAlliances/utlis/location.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/care.dart';

class CareCard extends StatefulWidget {
  CareCard({super.key, required this.data});

  final Care data;

  @override
  State<CareCard> createState() => _CareCardState();
}

class _CareCardState extends State<CareCard> {
  final LocationInfo _locationInfo = LocationInfo();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              color: Colors.grey, blurRadius: 10, offset: Offset(0.1, 1.0))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.data.name ?? "No Name",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          decoration: TextDecoration.combine([
                            TextDecoration.overline,
                            TextDecoration.underline
                          ])),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.data.address ?? "No Address",
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      widget.data.city ?? "No City",
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      widget.data.state ?? "No State",
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      widget.data.zip ?? "No Zip code",
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () async {
                try {
                  setState(() {
                    isLoading = true;
                  });
                  if (widget.data.address!.toLowerCase() != "no address") {
                    Location location = await _locationInfo
                        .getLatLngFromAddress(widget.data.address!);
                    String googleUrl =
                        'https://www.google.com/maps/search/?api=1&query=${location.latitude},${location.longitude}';
                    setState(() {
                      isLoading = false;
                    });
                    await launchUrl(Uri.parse(googleUrl));
                  }
                } catch (e) {
                  setState(() {
                    isLoading = false;
                  });
                  Get.snackbar("Location", "Unable to find location",
                      backgroundColor: Colors.red, colorText: Colors.white);
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 30,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: const Color(0xFF035397),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: isLoading
                      ? const SizedBox(
                          height: 10,
                          width: 10,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          "Visit now",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
