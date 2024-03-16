import 'package:app2/features/home/manage/models/homemodels/datamodels.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Details extends StatefulWidget {
  const Details({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductHomedata product;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var appBarDescription = 'Details';
    var description = widget.product.name;

    return SafeArea(
      child: Scaffold(
        appBar: _buildCustomAppBar(appBarDescription, context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h),
            CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                height: 30.h,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 7),
                autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                viewportFraction: 0.8,
                aspectRatio: 2.0,
                onPageChanged: (index, _) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: widget.product.images.map((image) {
                return SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => const Center(child: SpinKitWanderingCubes(
                      color: Colors.blue,

                      

                    )),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 2.h),
            Center(
              child: AnimatedSmoothIndicator(
                activeIndex: _currentIndex,
                count: widget.product.images.length,
                effect: const ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                ),
                onDotClicked: (index) {
                  context.read<CarouselController>().animateToPage(index);
                },
              ),
            ),
            SizedBox(height: 1.h),
            _buildSmallDescription(description),
            SizedBox(height: 4.h),
            _buildPriceAndDiscountSection(widget.product),
            SizedBox(height: 1.h),
            Expanded(
              child: SingleChildScrollView(
                child: _buildBigDescription(widget.product),
              ),
            ),
            _buildBigButton(widget.product),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildCustomAppBar(String appBarDescription, BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Colors.blue.shade900,
        ),
      ),
      title: Text(
        appBarDescription,
        style: TextStyle(
          color: Colors.blue.shade900,
          fontSize: 18.sp,
          overflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.blue.shade700,
            size: 30,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceAndDiscountSection(ProductHomedata product) {
    return Row(
      children: [
        const Padding(padding: EdgeInsets.only(left: 8)),
        Text(
          product.price.toString(),
          style: TextStyle(
            color: Colors.blue.shade800,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          product.oldPrice.toString(),
          style: const TextStyle(
            color: Color(0xffbcbcbc),
            decoration: TextDecoration.lineThrough,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 5.w),
        Container(
          height: 4.h,
          width: 9.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xffc5a3d7),
          ),
          child: Text(
            product.discount.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildSmallDescription(String description) {
    return Row(
      children: [
        const Padding(padding: EdgeInsets.only(left: 8)),
        Expanded(
          child: Text(
            description,
            style: TextStyle(
              color: Colors.blue.shade900,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.fade,
            ),
            softWrap: true,
            maxLines: 3,
          ),
        ),
        Row(
          children: [
            const Padding(padding: EdgeInsets.only(right: 8)),
            Icon(
              Icons.favorite_border_outlined,
              size: 33,
              color: Colors.blue.shade700,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBigDescription(ProductHomedata product) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Column(
        children: [
          Text(
            'About The Product',
            style: TextStyle(
              color: Colors.blue.shade700,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            product.description,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildBigButton(ProductHomedata product) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.blue.shade700,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Text(
              'Add To Cart',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
