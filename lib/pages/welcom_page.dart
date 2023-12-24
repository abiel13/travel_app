import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubits/app_cubit.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_largetext.dart';
import 'package:travel_app/widgets/app_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = ['welcome-one.png', 'welcome-two.png', 'welcome-three.png'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (_, index) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("img/${images[index]}"), fit: BoxFit.cover),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppLargeText(text: 'Trips'),
                      const AppText(
                        text: 'Mountain',
                        size: 28,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 250,
                        child: AppText(
                          text:
                              'Mountain Hikes Give You an incredible sense of freedom as well as endurance',
                          color: AppColors.textColor2,
                          size: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap:(){
                          BlocProvider.of<AppCubit>(context).getData();
                        } ,
                        child: Container(
                          width: 200,
                          child: Row(
                            children: [
                              ResponsiveButton(
                                width: 120,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: List.generate(3, (scrolli) {
                      return Container(
                        width: 8,
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        height: scrolli == index ? 25 : 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: scrolli == index
                              ? AppColors.mainColor
                              : AppColors.mainColor.withOpacity(0.3),
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
