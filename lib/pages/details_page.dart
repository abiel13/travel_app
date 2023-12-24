import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubits/app_cubit.dart';
import 'package:travel_app/cubits/app_cubit_states.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_largetext.dart';
import 'package:travel_app/widgets/app_text.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int gottenStars = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AppCubit, CubitState>(
      builder: (BuildContext context, state) {
        if (state is DetailState) {
          var place = state.place;
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                    right: 0,
                    left: 0,
                    child: Container(
                      height: 300,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'http://mark.bslmeiyu.com/uploads/${place.img}'),
                            fit: BoxFit.cover),
                      ),
                    )),
                Positioned(
                  top: 270,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20)
                        .copyWith(top: 10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 270,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(text: place.name),
                            AppLargeText(
                              text: '\$ ${place.people}',
                              color: AppColors.mainColor,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.mainColor,
                            ),
                            AppText(
                              text: place.location,
                              color: AppColors.textColor1,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                5,
                                (index) {
                                  return place.stars > index
                                      ? const Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        )
                                      : const Icon(Icons.star_outline);
                                },
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(left: 8),
                                child: Text('${place.stars}'))
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppLargeText(
                              text: 'People',
                              size: 20,
                            ),
                            AppText(
                              text: '${place.people}',
                              color: AppColors.textColor2,
                            ),
                            Container(
                              width: double.infinity,
                              height: 50,
                              margin: const EdgeInsets.only(top: 20),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (_, index) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: index == 0
                                          ? Colors.black
                                          : Colors.grey.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: AppLargeText(
                                        text: '${index + 1}',
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const AppLargeText(
                                  text: 'Description',
                                  size: 20,
                                ),
                                AppText(text: place.description),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.mainColor,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Icon(
                            Icons.favorite_border,
                            color: AppColors.mainColor,
                          ),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: ResponsiveButton(
                            isshort: true,
                            text: 'Book Trip Now',
                          ))
                    ],
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubit>(context).goHome();
                        },
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    ));
  }
}
