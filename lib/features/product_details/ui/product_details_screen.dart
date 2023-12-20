import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_intern_task/core/helper/nav_extension.dart';

import '../../../core/helper/spacing.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("msa")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Product Details Screen "),
            verticalSpace(20.h),
            TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text("go back"))
          ],
        ),
      ),
    );
  }
}
