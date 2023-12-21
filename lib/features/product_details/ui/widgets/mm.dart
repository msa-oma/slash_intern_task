// SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     //product images
//                     CarouselSlider(
//                       items: [sliderImage(0), sliderImage(1), sliderImage(2)],
//                       options: CarouselOptions(),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 45),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           // product name
//                           Text(widget.selectedProduct.name,
//                               style: const TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 18)),
//                           const Spacer(),

//                           // slash logo
//                           CircleAvatar(
//                             radius: 30.0,
//                             backgroundImage: NetworkImage(
//                                 widget.selectedProduct.brands.brandLogoUrl!),
//                             backgroundColor: Colors.transparent,
//                           )
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 45),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           //price of product
//                           Text(
//                             'EGP ${widget.selectedProduct.variations[0].price}',
//                             style: const TextStyle(
//                                 color: Colors.white, fontSize: 16),
//                           ),
//                           const Spacer(),
//                           // prand name
//                           Text(
//                             '${widget.selectedProduct.brands.brandName} ',
//                             style: const TextStyle(
//                                 color: Colors.white, fontSize: 14),
//                           ),
//                           horizontalSpace(10),
//                         ],
//                       ),
//                     ),
//                     verticalSpace(20.h),
//                     //Select product color
//                     SizedBox(
//                       height: 35,
//                       child: ListView.separated(
//                         padding: const EdgeInsets.symmetric(horizontal: 120),

//                         //EdgeInsetsDirectional.only(start: 10),
//                         scrollDirection: Axis.horizontal,
//                         itemCount: variations.colors.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return GestureDetector(
//                             onTap: () {},
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color:
//                                     ColorsManager.lighterGray.withOpacity(0.2),
//                                 // variations.colors[index].withOpacity(0.5),
//                                 // border: Border.all(color: Colors.white)
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(3.0),
//                                 child: CircleAvatar(
//                                     radius: 15.0,
//                                     backgroundColor: variations.colors[index]
//                                         .withOpacity(0.8)),
//                               ),
//                               //variations.colors[index].withOpacity(0.5)
//                             ),
//                           );
//                         },
//                         separatorBuilder: (context, index) {
//                           return horizontalSpace(10);
//                         },
//                       ),
//                     ),

//                     //============/
//                     sizeOrMaterial(variations, 'Size', 'select chart',
//                         variations.sizes, variations.sizes.isNotEmpty),
//                     verticalSpace(20.h),
//                     sizeOrMaterial(variations, 'Material', '',
//                         variations.materials, variations.materials.isNotEmpty),
//                     verticalSpace(15),

//                     //Description of Product
//                     Container(
//                       width: 160.w,
//                       height: 70.h,
//                       decoration: BoxDecoration(
//                           color: ColorsManager.gray.withOpacity(0.2),
//                           borderRadius: BorderRadius.circular(16)),
//                       child: Center(
//                         child: Text(widget.selectedProduct.description,
//                             textAlign: TextAlign.center,
//                             style: const TextStyle(
//                                 color: Colors.white, fontSize: 14)),
//                       ),
//                     ),

//                     //useless button or for better UX I thing
//                     TextButton(
//                         onPressed: () {
//                           context.pop();
//                         },
//                         child: const Text("go back",
//                             style:
//                                 TextStyle(color: Colors.white, fontSize: 14)))
//                   ],
//                 ),
//               )








/*import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_intern_task/core/helper/nav_extension.dart';
import 'package:slash_intern_task/features/product_details/data/models/product.dart';
import 'package:slash_intern_task/features/product_details/logic/cubit/product_state.dart';
import 'package:slash_intern_task/features/product_details/logic/help_with_variation.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/theming/colors.dart';
import '../logic/cubit/product_cubit.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product selectedProduct;

  const ProductDetailsScreen({
    super.key,
    required this.selectedProduct,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductCubit>(context)
        .emitProductDetailsState(widget.selectedProduct.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var variations = Variation.getFakeVariation(widget.selectedProduct.id);
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            "Product details",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: ColorsManager.darkblack,
        ),
        body: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(
                child: Text(
                  'please wait... ',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              );
            }
            if (state is Error) {
              return Center(
                child: Text('${state.error} ya habibi',
                    style: const TextStyle(color: Colors.white, fontSize: 18)),
              );
            }
            if (state is Success) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    //product images
                    CarouselSlider(
                      items: [sliderImage(0), sliderImage(1), sliderImage(2)],
                      options: CarouselOptions(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // product name
                          Text(widget.selectedProduct.name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                          const Spacer(),

                          // slash logo
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                widget.selectedProduct.brands.brandLogoUrl!),
                            backgroundColor: Colors.transparent,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //price of product
                          Text(
                            'EGP ${widget.selectedProduct.variations[0].price}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                          const Spacer(),
                          // prand name
                          Text(
                            '${widget.selectedProduct.brands.brandName} ',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                          horizontalSpace(10),
                        ],
                      ),
                    ),
                    verticalSpace(20.h),
                    //Select product color
                    SizedBox(
                      height: 35,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 120),

                        //EdgeInsetsDirectional.only(start: 10),
                        scrollDirection: Axis.horizontal,
                        itemCount: variations.colors.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    ColorsManager.lighterGray.withOpacity(0.2),
                                // variations.colors[index].withOpacity(0.5),
                                // border: Border.all(color: Colors.white)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: CircleAvatar(
                                    radius: 15.0,
                                    backgroundColor: variations.colors[index]
                                        .withOpacity(0.8)),
                              ),
                              //variations.colors[index].withOpacity(0.5)
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return horizontalSpace(10);
                        },
                      ),
                    ),

                    //============/
                    sizeOrMaterial(variations, 'Size', 'select chart',
                        variations.sizes, variations.sizes.isNotEmpty),
                    verticalSpace(20.h),
                    sizeOrMaterial(variations, 'Material', '',
                        variations.materials, variations.materials.isNotEmpty),
                    verticalSpace(15),

                    //Description of Product
                    Container(
                      width: 160.w,
                      height: 70.h,
                      decoration: BoxDecoration(
                          color: ColorsManager.gray.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                        child: Text(widget.selectedProduct.description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14)),
                      ),
                    ),

                    //useless button or for better UX I thing
                    TextButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: const Text("go back",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)))
                  ],
                ),
              );
            }
            return const Center(
              child: Text("something get wrong",
                  style: TextStyle(color: Colors.white, fontSize: 14)),
            );
          },
        ));
  }

// Show the available Sizes or Materials if any
  Visibility sizeOrMaterial(Variation variations, String type, String chart,
      List<String> sizeOrMaterial, bool visible) {
    return Visibility(
      visible: visible, //variations.sizes.isNotEmpty
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
            child: Row(
              children: [
                Text(
                  "Select $type",
                  style: const TextStyle(color: Colors.white),
                ),
                const Spacer(),
                Text(chart, style: const TextStyle(color: Colors.white))
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              itemCount: sizeOrMaterial.length, // variations.sizes.length,
              itemBuilder: (contxt, index) {
                return Container(
                  width: 75,
                  height: 30,
                  decoration: BoxDecoration(
                      color: ColorsManager.closeToGreen.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(
                      child: Text(
                          sizeOrMaterial[index])), //variations.sizes[index]
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 5);
              },
            ),
          )
        ],
      ),
    );
  }

//product images slider appears at the top of the screen
  Container sliderImage(int index) {
    bool isEndOfImages =
        widget.selectedProduct.variations[0].productVarientImages.length >
            index;
    return Container(
      height: 300,
      width: 250,
      decoration: BoxDecoration(
        color: ColorsManager.lighterGray,
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(25.0),
      ),
      clipBehavior: Clip.hardEdge,
      child: FadeInImage.assetNetwork(
        placeholder: 'assets/images/slashsplash.png',
        image: isEndOfImages
            ? widget
                .selectedProduct.variations[0].productVarientImages[index].image
            : widget
                .selectedProduct.variations[0].productVarientImages[0].image,
        width: 120,
        height: 150,
        fit: BoxFit.contain,
      ),
    );
  }
}
*/