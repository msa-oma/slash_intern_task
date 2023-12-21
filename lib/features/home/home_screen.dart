import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_intern_task/core/helper/nav_extension.dart';
import 'package:slash_intern_task/core/helper/spacing.dart';
import 'package:slash_intern_task/core/routing/routes.dart';
import 'package:slash_intern_task/core/theming/colors.dart';
import 'package:slash_intern_task/features/product_details/logic/cubit/product_cubit.dart';
import '../product_details/logic/cubit/product_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.darkblack,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: ColorsManager.darkblack,
        title: const Text(
          'Slash.',
          style: TextStyle(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(
              child: Text(
                'LOADING . . .',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            );
          }
          if (state is Error) {
            return Center(
              child: Text('${state.error} ya habibi'),
            );
          }
          if (state is Success) {
            print('state is success');
            return SingleChildScrollView(
              child: Column(
                children: [
                  // show all products in grid
                  GridView.builder(
                    itemCount: state.data.length, //
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 20,
                    ),
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      //should not be here
                      String url = state.data[index].variations[0]
                          .productVarientImages[0].image;
                      String url2 = state.data[index].brands.brandLogoUrl;
                      return Container(
                        height: 500,
                        padding: const EdgeInsets.only(top: 8),
                        color: ColorsManager.darkblack,
                        child: Column(children: [
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(Routes.productDetailsScreen,
                                  arguments: state.data[index]);
                            },
                            //product image widget
                            child: Container(
                              height: 185.h,
                              width: 180.w,
                              decoration: BoxDecoration(
                                color: ColorsManager.lighterGray,
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/images/slashsplash.png',
                                image: url,
                                width: 120.w,
                                height: 150.h,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          verticalSpace(5),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  // brand name  and product name
                                  child: Text(
                                    '${state.data[index].brands.brandName} - ${state.data[index].name} ',
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                                horizontalSpace(10),
                                // slash logo
                                CircleAvatar(
                                  radius: 15.0,
                                  backgroundImage: NetworkImage(url2),
                                  backgroundColor: Colors.transparent,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // product price
                                Text(
                                  'EGP ${state.data[index].variations[0].price}',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                horizontalSpace(40),
                                //===/
                                Icon(
                                  Icons.favorite_border_outlined,
                                  color: Colors.white,
                                  size: 25.dg,
                                ),
                                horizontalSpace(10),
                                //===/
                                Icon(
                                  Icons.shopping_cart_rounded,
                                  color: Colors.grey,
                                  size: 25.dg,
                                ),
                              ],
                            ),
                          )
                        ]),
                      );
                    },
                  ),
                  verticalSpace(30.h),
                ],
              ),
            );
          }
          return const Center(
            child: Text("something get wrong"),
          );
        },
      ),
    );
  }
}
