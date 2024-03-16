import 'package:app2/features/home/manage/cubit/featurebanner/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomSliderAnimation extends StatefulWidget {
  const CustomSliderAnimation({Key? key}) : super(key: key);

  @override
  _CustomSliderAnimationState createState() => _CustomSliderAnimationState();
}

class _CustomSliderAnimationState extends State<CustomSliderAnimation> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSucess) {
          final bannerData = state.homemodels.data.bannersdata;

          return Column(
            children: [
              CarouselSlider(
                carouselController: CarouselController(),
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  height: 28.h,
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
                items: List.generate(
                  bannerData.length,
                  (index) {
                    return Container(
                      width: 80.w,
                      height: 28.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          imageUrl: bannerData[index].image,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) {
                            print("Error loading image: $error");
                            return Container(
                              color: Colors.grey,
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
             SizedBox(height: 2.h),
              AnimatedSmoothIndicator(
                activeIndex: _currentIndex,
                count: bannerData.length,
                // effect: ExpandingDotsEffect(),
                effect: const ScrollingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: Colors.blue,
                  dotColor: Colors.grey,
                  radius: 10,
                  spacing: 8,
                
                  strokeWidth: 1,
                ),
                onDotClicked: (index) {
                  context.read<CarouselController>().animateToPage(index);
                }
                
              )
            ],
          );
        } else if (state is HomeError) {
          print(state.errorMessage);
          return Text('Error');
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
