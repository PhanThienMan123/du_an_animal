import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:widget_zoom/widget_zoom.dart';

class Page1 extends StatelessWidget {
  final String? title;
  final String? image;
  const Page1({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 0,
                    child: Container(
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(Icons.arrow_back)),
                    )),
                Expanded(
                  flex: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_outline)),
                      ),
                      Container(
                        child: IconButton(
                            onPressed: () {}, icon: Icon(Icons.more_vert)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            alignment: Alignment.topRight,
            child: Text(
              "November 13, 2024 - 12:34",
              style: TextStyle(color: Color(0xff71797e), fontSize: 15),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(title.toString(),
                style: GoogleFonts.robotoSlab(
                    fontSize: 29,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff36454f))),
          ),
          SizedBox(
            height: 15,
          ),
          // WidgetZoom(
          //     minScaleFullscreen: 1,
          //     heroAnimationTag: true,
          //     zoomWidget: Image.network(image.toString())),
          Container()
        ],
      ),
    ));
  }
}
