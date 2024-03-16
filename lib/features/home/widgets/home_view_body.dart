import 'package:app2/features/home/manage/cubit/featurebanner/home_cubit.dart';
import 'package:app2/features/home/manage/cubit/featurehombar/parapp_cubit.dart';
import 'package:app2/features/home/widgets/container_sellar.dart';
import 'package:app2/features/home/widgets/slideranimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeViewBody extends StatefulWidget {
  final String namexx;
  const HomeViewBody({Key? key, required this.namexx}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<HomeCubit>().getHomeData();
    context.read<ParappCubit>().getParappData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(widget.namexx),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(left: 1.w),
                    child: SizedBox(height: 130, child: cadListViewBuild()),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: bannerAnimation(),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 1.h)),
                SliverToBoxAdapter(
                  child:
                      SizedBox(height: 700, child: containersellerGridView()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget customAppBar(String name) {
    return AppBar(
      backgroundColor: const Color(0xff8c4baf),
      title: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              overflow: TextOverflow.ellipsis,
              "Welcome, $name",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "What would you like to buy today?",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_active_outlined,
                color: Colors.white,
                size: 33,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
                size: 33,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget containersellerGridView() {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state is HomeSucess) {
        final products = state.homemodels.data.productsdata;
        return SingleChildScrollView(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 1.h,
              crossAxisSpacing: 1.h,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              final productdata = products[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ContainerSellar(
                  product: productdata,
                ),
              );
            },
          ),
        );
      } else if (state is HomeError) {
        return Center(child: Text("error+ ${state.errorMessage}"));
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }

  Widget bannerAnimation() {
    return const CustomSliderAnimation();
  }

  Widget cadListViewBuild() {
    return BlocBuilder<ParappCubit, ParappState>(builder: (context, state) {
      if (state is ParappSucess) {
        final dr = state.categories.data.data;
        return ListView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          children: List.generate(
            state.categories.data.data.length,
            (index) {
              final y = dr[index];
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
                      Positioned.fill(
                        // يضع الطفقة بمساحة الطفقة الاصلية
                        child: Image.network(
                          y.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Center(
                        child: Text(
                          y.name,
                          style: const TextStyle(
                              color: Colors.amber, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      } else if (state is ParappError) {
        return Center(child: Text("error+ ${state.errorMessage}"));
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
