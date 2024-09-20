import 'package:CareAlliances/model/category.dart';
import 'package:CareAlliances/screens/category_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.data});

  final Category data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(CategoryDetail(data: data));
      },
      child: SingleChildScrollView(
        child: Card(
          color: Colors.white,
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                data.name!.isNotEmpty
                    ? Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * .12,
                            vertical: 20),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            color: Colors.blue),
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          alignment: Alignment.center,
                          child: Text(
                            data.name!.isNotEmpty ? data.name! : "No Name",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    : Container(),
                _showText("${data.edate ?? ""} ${data.etime ?? ""}", context),
                _showText(data.category, context),
                _showText(data.address, context),
                _showText(
                    "${data.city ?? ""} ${data.state ?? ""} ${data.zip ?? ""}",
                    context),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _showText(String? text, BuildContext context) {
    return text != null && text.trim().isNotEmpty
        ? Container(
            width: double.infinity,
            padding: EdgeInsets.only(
                bottom: 8.0,
                right: MediaQuery.of(context).size.width * .15,
                left: MediaQuery.of(context).size.width * .15),
            child: FittedBox(
              child: Text(
                text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          )
        : Container();
  }
}
