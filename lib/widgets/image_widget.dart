import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:wbid/constents/constents.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget(
      {Key? key,
      this.height,
      this.imageBase641,
      this.imageBase642,
      this.imageBase643,
      this.imageBase644,
      this.imageBase645,
      this.imageBase646})
      : super(key: key);

  final double? height;
  final dynamic imageBase641,
      imageBase642,
      imageBase643,
      imageBase644,
      imageBase645,
      imageBase646;

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  final c = CarouselControllerImpl();
  dynamic _image1, _image2, _image3, _image4, _image5, _image6;
  List<dynamic>? _imageList;

  CarouselSlider _chek() {
    if (widget.imageBase641 == null ||
        widget.imageBase642 == null ||
        widget.imageBase643 == null ||
        widget.imageBase644 == null ||
        widget.imageBase645 == null ||
        widget.imageBase646 == null) {
      _image1 = backgroundimage;
      _image2 = backgroundimage;
      _image3 = backgroundimage;
      _image4 = backgroundimage;
      _image5 = backgroundimage;
      _image6 = backgroundimage;

      _imageList = [_image1, _image2, _image3, _image4, _image5, _image6];
      return CarouselSlider(
        carouselController: c,
        items: _imageList!
            .map((e) => ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        e,
                        height: 700,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ))
            .toList(),
        options: CarouselOptions(
          autoPlay: false,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          height: (widget.height == null) ? 250 : widget.height,
        ),
      );
    } else {
      _image1 = base64Decode(widget.imageBase641.toString());
      _image2 = base64Decode(widget.imageBase642.toString());
      _image3 = base64Decode(widget.imageBase643.toString());
      _image4 = base64Decode(widget.imageBase644.toString());
      _image5 = base64Decode(widget.imageBase645.toString());
      _image6 = base64Decode(widget.imageBase646.toString());

      _imageList = [_image1, _image2, _image3, _image4, _image5, _image6];
      return CarouselSlider(
        carouselController: c,
        items: _imageList!
            .map((e) => ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.memory(
                        e,
                        height: 700,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ))
            .toList(),
        options: CarouselOptions(
          autoPlay: false,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          height: (widget.height == null) ? 250 : widget.height,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _chek();
  }
}
