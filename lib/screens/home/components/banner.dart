import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_android/constants.dart';

final List<String> imgList = ['banner01.png', 'banner02.png', 'banner03.png'];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          height: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage('assets/images/$item'),
                fit: BoxFit.cover,
              )),
        ))
    .toList();

Widget banner() {
  return Container(
    height: 170.0,
    decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(7),
          bottomRight: Radius.circular(7),
        ),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 10),
              blurRadius: 10,
              color: primaryColor.withOpacity(0.3))
        ]),
    child: CarouselSlider(
      items: [
        img('banner01.png'),
        img('banner02.png'),
        img('banner03.png'),
      ],
      options: CarouselOptions(
          height: 150.0,
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastLinearToSlowEaseIn,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 0.83,
          scrollDirection: Axis.horizontal),
    ),
  );
}

Widget img(String link) {
  return Container(
    // margin: EdgeInsets.all(10),

    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage('assets/images/$link'),
          fit: BoxFit.cover,
        )),
  );
}

class BannerHome extends StatefulWidget {
  const BannerHome({Key? key}) : super(key: key);

  @override
  _BannerHomeState createState() => _BannerHomeState();
}

class _BannerHomeState extends State<BannerHome> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.0,
      decoration: BoxDecoration(color: primaryColor,
          // borderRadius: const BorderRadius.only(
          //   bottomLeft: Radius.circular(7),
          //   bottomRight: Radius.circular(7),
          // ),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 10),
                blurRadius: 10,
                color: primaryColor.withOpacity(0.3))
          ]),
      child: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              items: imageSliders,
              carouselController: _controller,
              options: CarouselOptions(
                  height: 170.0,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                  enableInfiniteScroll: true,
                  viewportFraction: 0.83,
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.light
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
