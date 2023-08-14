import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ui_travel/models/activity_model.dart';
import 'package:ui_travel/screens/activity_details_screen.dart';
import 'package:ui_travel/widgets/custom_header.dart';
import 'package:ui_travel/widgets/side_bar.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);
  static const routeName = "/activities";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    List<Activity> activities = Activity.activities;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomHeader(
            title: "パッケージ",
          ),
          _ActivitiesMasonryGrid(width: width, activities: activities)
        ],
      ),
    );
  }
}

class _ActivitiesMasonryGrid extends StatelessWidget {
  final double width;
  final List<Activity> activities;
  final List<double> masonryCardHeights;

  const _ActivitiesMasonryGrid(
      {super.key,
      required this.width,
      required this.activities,
      this.masonryCardHeights = const [200, 250, 300]});
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(10),
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemCount: 7,
        itemBuilder: (context, index) {
          Activity activity = activities[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ActivityDetailsScreen(activity: activity)));
            },
            child: Column(
              children: [
                Hero(
                  tag: "${activity.id}_${activity.title}",
                  child: Container(
                    height: masonryCardHeights[index % 3],
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage(activity.imageUrl),
                            fit: BoxFit.cover)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  activity.title,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
          );
        });
  }
}
