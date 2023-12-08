import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/application/blocs/meals/meals_bloc.dart';
import 'package:nibbles_ecommerce/repositories/categories_repos/categories_repos.dart';
import 'package:nibbles_ecommerce/repositories/meals_repos/meal_repo.dart';

import '../../application/blocs/categories/categories_bloc.dart';
import '../../application/cubits/navigation/navigation_cubit.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';
import '../router/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CategoriesBloc(categoriesRepos: CategoriesRepos())
                ..add(LoadCategories()),
        ),
       /* BlocProvider(
          create: (context) =>
              MealsBloc(mealsRepo: MealsRepo(), categoryId: '')
                ..add(LoadMeals()),
        ),*/
        BlocProvider(create: (context) => NavigationCubit()),
      ],
      child: MaterialApp(
        title: 'Nibbles',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRouter.splash,
        theme: ThemeData(
          fontFamily: AppStrings.fontFamily,
          scaffoldBackgroundColor: AppColors.scafoldBackground,
        ),
      ),
    );
  }
}