import 'package:CareAlliances/screens/web_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Alliances extends StatelessWidget {
  Alliances({super.key});

  final List<Map<String, dynamic>> links = [
    {
      "heading": "Who are you?",
      "title": "Who Are You?",
      "imageUrl": "https://thecarealliances.com/images/banner.jpg",
      "link": "https://thecarealliances.com/who-am-i.php"
    },
    {
      "heading": "I Can help",
      "title": "I Can Help",
      "imageUrl": "https://thecarealliances.com/images/2.jpg",
      "link": "https://thecarealliances.com/i-can-help.php"
    },
    {
      "heading": "I need help",
      "title": "I Need Help",
      "imageUrl": "https://thecarealliances.com/images/3.jpg",
      "link": "https://thecarealliances.com/i-need-help.php"
    },
    {
      "heading": "Calendar",
      "title": "Calendar ",
      "imageUrl": "https://thecarealliances.com/images/11.png",
      "link": "https://thecarealliances.com/calendar.php"
    },
    {
      "heading": "Join ",
      "title": "Join, Find or Create A Community ",
      "imageUrl": "https://thecarealliances.com/images/5.jpg",
      "link": "https://thecarealliances.com/create-new-community.php"
    },
    {
      "heading": "Life Strategies",
      "title": "Life Strategies-Create A Plan ",
      "imageUrl": "https://thecarealliances.com/images/6.jpg",
      "link": "https://thecarealliances.com/create-your-plan.php"
    },
    {
      "heading": "Edutainment",
      "title": "Edutainment,Culture & Lifestyle ",
      "imageUrl": "https://thecarealliances.com/images/7.jpg",
      "link":
          "https://thecarealliances.com/edutainment-culture-and-lifestyle.php"
    },
    {
      "heading": "The mentoring",
      "title": "The Mentoring and Life Coaching Portals",
      "imageUrl": "https://thecarealliances.com/images/8.jpg",
      "link": "https://thecarealliances.com/mentoring-portal.php"
    },
    {
      "heading": "Share my experience",
      "title": "Share My Experiences-Your Story and Experiences",
      "imageUrl": "https://thecarealliances.com/images/4.jpg",
      "link": "https://thecarealliances.com/share-experiences.php"
    },
    {
      "heading": "My day wheel",
      "title": "MyDayWheel and Life Quest Apps Living Your Best Life",
      "imageUrl": "https://thecarealliances.com/images/wheel.jpg",
      "link": "https://thecarealliances.com/wheel.php"
    },
    {
      "heading": "Spotlight",
      "title": "Spotlight ",
      "imageUrl": "https://thecarealliances.com/images/12.jpg",
      "link": "https://thecarealliances.com/spotlight.php"
    },
    {
      "heading": "Notional care alliances",
      "title":
          "National Care Alliances' Property Management and Investment Group ",
      "imageUrl": "https://thecarealliances.com/images/14.jpg",
      "link": "https://thecarealliances.com/create-property.php"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        elevation: 0,
        // iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Alliance",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4),
        child: GridView.builder(
          itemCount: links.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> temp = links[index];
            return InkWell(
              onTap: () {
                Get.to(WebPage(title: temp["heading"], webUrl: temp["link"]));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xff1e6ccc),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Expanded(
                        child: Image.network(
                      temp["imageUrl"],
                      fit: BoxFit.cover,
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        temp["title"],
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        ),
      ),
    );
  }
}
