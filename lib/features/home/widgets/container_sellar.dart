import 'package:animations/animations.dart';
import 'package:app2/features/home/manage/models/homemodels/datamodels.dart';
import 'package:app2/features/home/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContainerSellar extends StatelessWidget {
  final ProductHomedata product;
  const ContainerSellar({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
    transitionDuration: const Duration(milliseconds: 500),
      transitionType: ContainerTransitionType.fadeThrough,
      openElevation: 1,
      closedElevation: 1,
      closedBuilder: (context, action) {
       return Container(
        height: 400,
        width: 80.w,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.shade300,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              color: Colors.grey,
              child: Image.network(
                product.image,
                fit: BoxFit.cover,
                height: 10.h,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text.rich(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                TextSpan(children: [
                  TextSpan(
                    text: product.name,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        shadows: const [
                          Shadow(
                            color: Colors.grey,
                          )
                        ],
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ])),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    product.price.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 20.sp,
                    ),
                  ),
                  const Icon(
                    Icons.favorite_border,
                    size: 30,
                    color: Colors.blue,
                    weight: 20,
                  ),
                ]),
          )
        ]),
      );
      }, openBuilder: (BuildContext context, void Function({Object? returnValue}) action) { 
       return Details(product: product);
       },
    );
  }
}
