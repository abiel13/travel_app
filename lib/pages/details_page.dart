import 'package:flutter/material.dart';
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
    return Scaffold(
      body: Container(
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
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('img/mountain.jpeg'),
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
                        AppLargeText(text: 'Yangenite'),
                        AppLargeText(
                          text: '\$250',
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
                          text: 'USA California',
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
                              return gottenStars > index
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
                            child: const Text('(3.0)'))
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
                          text:
                              'Enjoy the lovely people of California at mount Yangenite',
                          color: AppColors.textColor2,
                        ),
                        Container(
                          width: double.infinity,
                          height: 70,
                          margin: const EdgeInsets.only(top: 20),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (_, index) {
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: index == 0
                                      ? Colors.black
                                      : Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: AppLargeText(
                                    text: '$index',
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
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLargeText(
                              text: 'Description',
                              size: 20,
                            ),
                            AppText(
                                text:
                                    'a lot of bullshit typing at exactly 11:14pm feeling really exhausted but have to keep getting better what a shitty life i have no friends only code line no hugs only bugs .'),
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
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
