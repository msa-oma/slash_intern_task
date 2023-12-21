import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_intern_task/core/routing/routes.dart';
import 'package:slash_intern_task/features/product_details/data/models/product.dart';
import 'package:slash_intern_task/features/product_details/logic/cubit/product_cubit.dart';

import '../../features/home/home_screen.dart';
import '../../features/product_details/ui/product_details_screen.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    // ignore: unused_local_variable
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ProductCubit>()..emiteProductState(),
            child: const HomeScreen(),
          ),
        );

      case Routes.productDetailsScreen:
        final selecteproduct = settings.arguments as Product;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ProductCubit>(),
            child: ProductDetailsScreen(
              selectedProduct: selecteproduct,
            ),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
