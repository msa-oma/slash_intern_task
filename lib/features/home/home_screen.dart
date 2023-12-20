import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_intern_task/core/helper/nav_extension.dart';
import 'package:slash_intern_task/core/helper/spacing.dart';
import 'package:slash_intern_task/core/routing/routes.dart';
import 'package:slash_intern_task/features/product_details/logic/cubit/product_cubit.dart';
import '../product_details/logic/cubit/product_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: const Text('slash /.'),
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(
              child: Text('LOADING'),
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
                  GridView.builder(
                    itemCount: state.data.length, //
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      String url = state.data[index].variations[0]
                          .productVarientImages[0].image;
                      return Container(
                        color: Colors.black,
                        child: Column(children: [
                          Image.network(
                            url,
                            fit: BoxFit.cover,
                          ),
                          Text(state.data[index].name)
                        ]),
                      );
                    },
                  ),
                  verticalSpace(20.h),
                  IconButton(
                      onPressed: () {
                        context.pushNamed(Routes.productDetailsScreen);
                      },
                      icon: const Icon(Icons.arrow_right_alt))
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
