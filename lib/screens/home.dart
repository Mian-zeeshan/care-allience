import 'package:CareAlliances/model/care.dart';
import 'package:CareAlliances/model/menu.dart';
import 'package:CareAlliances/screens/main_category.dart';
import 'package:CareAlliances/screens/web_page.dart';
import 'package:CareAlliances/utlis/location.dart';
import 'package:CareAlliances/utlis/menu_links.dart';
import 'package:CareAlliances/widget/custom_drawer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/care_card.dart';
import '../widget/search.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    this.tabIndex = 1,
  });

  final int tabIndex;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final dio = Dio();
  List<Care> list = [];
  bool isLoading = false;
  int tabIndex = 1;

  loadData(String search, String category, String state, String zipcode,
      String city) async {
    final response = await dio.get('https://thecarealliances.com/zapi.php',
        queryParameters: {
          "state": state,
          "zip": zipcode,
          "search": search,
          "city": city
        });
    List<Care> tempList = (response.data as List<dynamic>)
        .map((json) => Care.fromJson(json))
        .toList();

    setState(() {
      tabIndex = 0;
      isLoading = false;
    });
    setState(() {
      list = tempList;
    });
  }

  @override
  void initState() {
    setState(() {
      tabIndex = widget.tabIndex;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        shadowColor: Colors.white,
        backgroundColor: const Color(0xff035397),
        elevation: 0,
        // iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          children: [
            Image.asset(
              "assets/images/icon.png",
              fit: BoxFit.contain,
              width: 40,
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "Care Alliances",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Search(
            loadData: loadData,
            setLoading: (bool isLoading) {
              setState(() {
                isLoading = this.isLoading;
              });
            },
            reset: () {
              setState(() {
                tabIndex = 1;
                list = [];
              });
            },
          ),
          Expanded(
            child: Stack(
              children: [
                tabIndex == 1 || list.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(4),
                        child: GridView.builder(
                          itemCount: MenuLinks.links.length,
                          itemBuilder: (context, index) {
                            Menu temp = MenuLinks.links[index];
                            return InkWell(
                              onTap: () {
                                if (temp.isWebView) {
                                  Get.to(WebPage(
                                      title: temp.heading, webUrl: temp.link));
                                } else {
                                  Get.to(MainCategory(
                                    url: temp.link,
                                    heading: temp.heading,
                                    title: temp.title,
                                    imgUrl: temp.imageUrl,
                                  ));
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xff1e6ccc),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: Image.network(
                                      temp.imageUrl,
                                      fit: BoxFit.cover,
                                    )),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        temp.title,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(4),
                        child: GridView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return CareCard(
                              data: list[index],
                            );
                          },
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                        ),
                      ),
                isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xff035397),
                        ),
                      )
                    : const Stack()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// list.map((e) => CareCard()).toList()
