import 'package:app2/features/home/manage/models/category/categorieshome.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CartHome extends StatelessWidget {
  const CartHome({Key? key, required this.category}) : super(key: key);
  final CategoryModels category;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 55.w,
      child: Card(
        semanticContainer: true,
        elevation: 10,
        margin: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.transparent, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          children: [
            Positioned.fill( // يضع الطفقة بمساحة الطفقة الاصلية
              child: Image.network(
                'https://img.freepik.com/free-vector/apple-colorful-vector-design_341269-1123.jpg?size=338&ext=jpg&ga=GA1.1.1448711260.1707177600&semt=sph',            
                fit: BoxFit.cover,
              ),
            ),
            const Center(
              child: Text(
                'category.name',
                style: TextStyle(color: Colors.amber, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
