import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubits/app_cubit.dart';
import 'package:travel_app/cubits/app_cubit_states.dart';
import 'package:travel_app/pages/details_page.dart';
import 'package:travel_app/pages/home_page.dart';
import 'package:travel_app/pages/nav_pages/main_page.dart';
import 'package:travel_app/pages/welcom_page.dart';

class AppCubitLogic extends StatefulWidget {
  const AppCubitLogic({super.key});

  @override
  State<AppCubitLogic> createState() => _AppCubitLogicState();
}

class _AppCubitLogicState extends State<AppCubitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, CubitState>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return const WelcomePage();
          }
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DetailState) {
            return const Center(
              child: DetailsPage(),
            );
          }
          if (state is LoadedState) {
            return const MainPage();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
