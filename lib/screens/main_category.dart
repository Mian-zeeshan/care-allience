import 'package:CareAlliances/model/category.dart';
import 'package:CareAlliances/widget/CategoryCard.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../widget/custom_drawer.dart';
import '../widget/search.dart';

class MainCategory extends StatefulWidget {
  const MainCategory(
      {super.key,
      required this.url,
      required this.title,
      required this.imgUrl,
      required this.heading});

  final String url;
  final String title;
  final String heading;
  final String imgUrl;

  @override
  State<MainCategory> createState() => _MainCategoryState();
}

class _MainCategoryState extends State<MainCategory> {
  final dio = Dio();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Category> _categoryList = [];

  bool _isLoading = false;

  loadData(String search, String category, String state, String zipcode,
      String city) async {
    try {
      setState(() {
        _isLoading = true;
      });
      var response = await dio.get(widget.url, queryParameters: {
        "state": state,
        "zip": zipcode,
        "search": search,
        "city": city
      });
      List<Category> categoryList = response.data
          .map<Category>((json) => Category.fromJson(json))
          .toList();
      setState(() {
        _categoryList =
            categoryList.where((element) => element.name!.isNotEmpty).toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _categoryList = [];
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData("", "", "", "", "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: Text(
          widget.heading,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(
                widget.imgUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  color: Colors.black45,
                ),
              ),
              Positioned(
                  top: 0,
                  bottom: 0,
                  right: MediaQuery.of(context).size.width*.3,
                  left: MediaQuery.of(context).size.width*.3,
                  child: FittedBox(
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ))
            ],
          ),
          Search(
            loadData: loadData,
            setLoading: (bool isLoading) {
              setState(() {
                _isLoading = isLoading;
              });
            },
            reset: () {
              loadData("", "", "", "", "");
            },
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    )
                  : _categoryList.isNotEmpty
                      ? GridView.builder(
                          itemCount: _categoryList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return CategoryCard(
                              data: _categoryList[index],
                            );
                          },
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, ),
                        )
                      : const Center(
                          child: Text(
                            "No Data",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
            ),
          ),
        ],
      ),
    );
  }
}
