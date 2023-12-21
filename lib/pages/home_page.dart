import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_largetext.dart';
import 'package:travel_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Map<String, String> images = {
    "hiking.png": "hicking",
    "kayaking.png": "kayaking",
    "snorkling.png": "snorkling",
    "balloning.png": "balloning"
  };

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black54,
                ),
                Container(
                  height: 50,
                  width: 50,
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.4),
                  ),
                  child: Icon(
                    Icons.cookie,
                    color: AppColors.mainColor,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const AppLargeText(text: 'Discover'),
              const SizedBox(
                height: 20,
              ),
              //tabar
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                      controller: tabController,
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.black54,
                      isScrollable: true,
                      dividerColor: Colors.white,
                      labelPadding: const EdgeInsets.only(right: 20),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: CircleTabIndicator(
                          color: AppColors.mainColor, radius: 5),
                      tabs: const [
                        Tab(
                          text: 'Places',
                        ),
                        Tab(
                          text: 'Inspiration',
                        ),
                        Tab(
                          text: 'Emotions',
                        ),
                      ]),
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 300,
                child: TabBarView(controller: tabController, children: [
                  ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 200,
                          height: 300,
                          margin: const EdgeInsets.only(top: 20, right: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: const DecorationImage(
                                  image: AssetImage(
                                    'img/mountain.jpeg',
                                  ),
                                  fit: BoxFit.cover)),
                        );
                      }),
                  const Text('there'),
                  const Text('bye')
                ]),
              )
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppLargeText(
                  text: 'Explore more',
                  size: 20,
                ),
                AppText(
                  text: 'See all',
                  color: AppColors.mainColor,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            height: 100,
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, int index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(
                                    'img/${images.keys.elementAt(index)}'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Text(
                          images.values.elementAt(index),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 12),
                        )
                      ],
                    ),
                  );
                }),
          )
        ]),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2, configuration.size!.height);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
