import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_android/model/product.dart';

final List<String> imgList = [
  'product01.jpg',
  // 'product02.jpg',
  // 'product03.jpg',
  // 'product04.jpg',
  // 'product05.jpg',
  // 'product01.jpg'
];

class ImgSlider extends StatefulWidget {
  const ImgSlider({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<ImgSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    // imgList.add(widget.product.avatar);

    // final List<Widget> imageSliders = imgList
    //     .map((item) => Container(
    //           height: 200,
    //           decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(10.0),
    //               image: DecorationImage(
    //                 image: AssetImage('assets/images/product/$item'),
    //                 fit: BoxFit.cover,
    //               )),
    //         ))
    //     .toList();
    return Container(
      height: 270,
      // width: 500,
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              items: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/product/${widget.product.avatar}'),
                        fit: BoxFit.cover,
                      )),
                ),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/product/${widget.product.avatar}'),
                        fit: BoxFit.cover,
                      )),
                ),
              ],
              carouselController: _controller,
              options: CarouselOptions(
                  height: 270.0,
                  enlargeCenterPage: true,
                  aspectRatio: 18 / 9,
                  autoPlayCurve: Curves.easeIn,
                  enableInfiniteScroll: true,
                  viewportFraction: 1,
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
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
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
