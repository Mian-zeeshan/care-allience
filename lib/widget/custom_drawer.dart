import 'package:CareAlliances/screens/home.dart';
import 'package:CareAlliances/screens/web_page.dart';
import 'package:CareAlliances/utlis/menu_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/main_category.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff0d0908),
      child: Padding(
        padding: EdgeInsets.only(top: Get.size.height * .05),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: Center(child: Image.asset("assets/images/icon.png")),
              ),
              ListTile(
                title: const Text("Home",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: 13)),
                onTap: () {
                  Get.back();
                  Get.to(
                      const Home(
                        tabIndex: 1,
                      ),
                      preventDuplicates: false);
                },
              ),
              ListTile(
                title: const Text("Login",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: 13)),
                onTap: () {
                  Get.back();
                  Get.to(
                      const WebPage(
                          title: "Login",
                          webUrl:
                              "https://thecarealliances.com/login.php?app=1"),
                      preventDuplicates: false);
                },
              ),
              ListTile(
                title: const Text("Join",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: 13)),
                onTap: () {
                  Get.back();
                  Get.to(
                      const WebPage(
                          title: "Join",
                          webUrl:
                              "https://thecarealliances.com/sign-up.php?app=1"),
                      preventDuplicates: false);
                },
              ),
               ListTile(
                title: const Text("Alliances",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: 13)),
                onTap: () {
                  Get.back();
                  Get.to(
                      const WebPage(
                          title: "Alliances",
                          webUrl:
                              "https://thecarealliances.com/sites.php?app=1"),
                      preventDuplicates: false);
                },
              ),
              ...(MenuLinks.links
                  .map((e) => ListTile(
                        key: ValueKey(e.title),
                        title: Text(e.heading,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 13)),
                        onTap: () {
                          Get.back();
                          if (e.isWebView) {
                            Get.to(WebPage(title: e.heading, webUrl: e.link),
                                preventDuplicates: false);
                          } else {
                            Get.to(
                                MainCategory(
                                  key: ValueKey(e.title),
                                  url: e.link,
                                  heading: e.heading,
                                  title: e.title,
                                  imgUrl: e.imageUrl,
                                ),
                                preventDuplicates: false);
                          }
                        },
                      ))
                  .toList()),
              ListTile(
                title: const Text("About Us",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: 13)),
                onTap: () {
                  Get.to(
                      const WebPage(
                          title: "About us",
                          webUrl:
                              "https://thecarealliances.com/about-us.php?app=1"),
                      preventDuplicates: false);
                },
              ),
              ListTile(
                title: const Text("Services",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: 13)),
                onTap: () {
                  Get.back();
                  Get.to(
                      const WebPage(
                          title: "Services",
                          webUrl:
                              "https://thecarealliances.com/services.php?app=1"),
                      preventDuplicates: false);
                },
              ),
              ListTile(
                title: const Text("Care Alliances TV",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: 13)),
                onTap: () {
                  Get.back();
                  Get.to(
                      const WebPage(
                          title: "Care Alliances TV",
                          webUrl:
                              "https://thecarealliances.com/alliances.php?app=1"),
                      preventDuplicates: false);
                },
              ),
              ListTile(
                title: const Text("Programs",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: 13)),
                onTap: () {
                  Get.to(
                      const WebPage(
                          title: "Programs",
                          webUrl:
                              "https://thecarealliances.com/programs.php?app=1"),
                      preventDuplicates: false);
                },
              ),
              // ListTile(
              //   title: const Text("Shop",
              //       maxLines: 1,
              //       overflow: TextOverflow.ellipsis,
              //       style: TextStyle(color: Colors.white, fontSize: 13)),
              //   onTap: () {
              //     Get.back();
              //     Get.to(
              //         const WebPage(
              //             title: "Shop",
              //             webUrl:
              //                 "https://thecarealliances.com/category.php?app=1"),
              //         preventDuplicates: false);
              //   },
              // ),
              ListTile(
                title: const Text("Contact",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: 13)),
                onTap: () {
                  Get.back();
                  Get.to(
                      const WebPage(
                          title: "Contact",
                          webUrl:
                              "https://thecarealliances.com/contact-us.php?app=1"),
                      preventDuplicates: false);
                },
              ),
              ListTile(
                title: const Text("Privacy Policy",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: 13)),
                onTap: () {
                  Get.back();
                  Get.to(
                      const WebPage(
                          title: "Privacy Policy",
                          webUrl:
                              "https://thecarealliances.com/privacy.php?app=1"),
                      preventDuplicates: false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
