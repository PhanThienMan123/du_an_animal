import 'package:carousel_slider/carousel_slider.dart';
import 'package:du_an_animal/Constant/Constant.dart';
import 'package:du_an_animal/Models/DataNews.dart';
import 'package:du_an_animal/Pages/PageNews/InformationNews.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final urlImages = [
    "https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Panthera_tigris_tigris.jpg/800px-Panthera_tigris_tigris.jpg",
    "https://earth.org/wp-content/uploads/2022/12/Untitled-1024-%C3%97-683px-73-1200x900.jpg",
    "https://files.worldwildlife.org/wwfcmsprod/images/African_elephant_YE2021_Karine_Aigner_5kzx389mvt/magazine_small/1s803ne5x2_elephantv2.jpg",
    "https://environment.co/wp-content/uploads/sites/4/2024/01/squaddeepfx_photorealistic_image_of_a_blue_whale_mother_and_cal_39128ed5-e129-4267-938e-65217468be14.jpg",
    "https://cdn.britannica.com/92/152292-050-EAF28A45/Bald-eagle.jpg",
    "https://www.treehugger.com/thmb/hABHkJldvMOC7FMjwJS493YoSZs=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/cooper-s-hawk-profile-583855629-d89e191a88d1484db08800f067ba98e8.jpg",
    "https://cdn.vallarta-adventures.com/sites/default/files/2021-08/dolphin-facts.jpg"
  ];
  int activeIndex = 0;
  final List AnimalNews = [
    News(
        title: "In Bhutan, the endangered Bengal tiger is making a comeback",
        image:
            "https://cdn.unenvironment.org/s3fs-public/inline-images/afp.com-20200316-partners-058-2444832-highres.jpg"),
    News(
        title:
            "African elephants address one another by unique name-like calls, new study suggests",
        image:
            "https://d3i6fh83elv35t.cloudfront.net/static/2024/06/file-20240610-17-2o6hpo-1200x900.jpg"),
    News(
        title:
            "Pacific Indigenous leaders have a new plan to protect whales. Treat them as people",
        image:
            "https://media.cnn.com/api/v1/images/stellar/prod/shutterstock-editorial-9544920a.jpg?c=16x9&q=h_653,w_1160,c_fill/f_webp"),
    News(
        title: "World's first IVF rhino pregnancy 'could save species'",
        image:
            "https://ichef.bbci.co.uk/news/1024/cpsprodpb/66BB/production/_132399262_screenshot2024-01-22at21.40.06.png.webp")
  ];
  // late YoutubePlayerController controller;

  // @override
  // void initState() {
  //   super.initState();
  //   controller = YoutubePlayerController(initialVideoId: "MhhAox6Zei8");
  // }
  // PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 24),
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 13,
              decoration: BoxDecoration(color: Color(0xff2e8b57)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 0,
                      child: Container(
                        // margin: EdgeInsets.only(top: 14),
                        // decoration: BoxDecoration(color: Colors.red),
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyHomePage(),
                                  ));
                            },
                            child: Text(
                              "Animal Discovery",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Domine"),
                            )),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 17,
            ),
            Center(
              child: Column(
                children: <Widget>[
                  CarouselSlider.builder(
                      itemCount: urlImages.length,
                      itemBuilder: (context, index, realIndex) {
                        final urlImage = urlImages[index];
                        return BuildImage(urlImage, index);
                      },
                      options: CarouselOptions(
                        height: 300,
                        viewportFraction: 0.9,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 2),
                        initialPage: 0,
                        // reverse: true,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        onPageChanged: (index, reason) {
                          setState(() {
                            activeIndex = index;
                          });
                        },
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  buidIndicator()
                ],
              ),
            ),
            // YoutubePlayer(controller: controller),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color(0xff2e8b57),
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "NEWS",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Container(
              // decoration: BoxDecoration(color: Colors.amber),
              padding: EdgeInsets.all(10),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: AnimalNews.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2.0,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 300),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => Page1(
                          title: AnimalNews[index].title,
                          image: AnimalNews[index].image));
                    },
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(AnimalNews[index].image),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 150),
                            height: 100,
                            decoration: BoxDecoration(
                                color: Color(0xffe5e4e2),
                                borderRadius: BorderRadius.circular(15)),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              child: Text(
                                AnimalNews[index].title,
                                textAlign: TextAlign.start,
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ))
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget BuildImage(String urlImage, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        color: Colors.grey,
        width: double.infinity,
        child: Image.network(
          urlImage,
          fit: BoxFit.fill,
        ),
      );
  Widget buidIndicator() => AnimatedSmoothIndicator(
      activeIndex: activeIndex, count: urlImages.length);
}
