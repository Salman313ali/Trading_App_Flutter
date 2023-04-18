import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trading_app/src/Constants/Color.dart';

class MSlider extends StatefulWidget {
  const MSlider({super.key,
    required this.mainPath,
    required this.picsPath,
    required this.cont,
  });
  final String mainPath;
  final List<String> picsPath;
  final List<String> cont;
  @override
  State<MSlider> createState() => _MSliderState();
}

class _MSliderState extends State<MSlider> {
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 34.0/757* size.height,vertical: 34.0/1600* size.height),
          child: Text(
            widget.cont[currentIndex],
            style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.grey[700]),
            textAlign: TextAlign.center,
            textScaleFactor: size.width/757,
          ),
        ),
        SizedBox(height: 10.0,),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: CarouselSlider(
              items: widget.picsPath.map((i){
                return Image(
                  image: AssetImage("${widget.mainPath}${i}"),
                  fit: BoxFit.fitWidth,
                  width: MediaQuery.of(context).size.width,
                );
              }).toList(),
              carouselController: carouselController,
              options: CarouselOptions(
                  initialPage: 0,
                  autoPlay: true,
                  aspectRatio: 2,
                  viewportFraction: 2,
                  height: 320,
                  onPageChanged: (index,reason){
                    setState(() {
                      currentIndex = index;
                    });
                  }
              ),
          ),
            ),
            Positioned(
              bottom: 0,
            child: AnimatedSmoothIndicator(
            count: widget.picsPath.length,
            activeIndex: currentIndex,
              effect: WormEffect(
                activeDotColor: TGreen,
                dotHeight: 5.0/1600* size.height
              ),
        ),
        )],
        ),
      ],
    );
    
  }
}
