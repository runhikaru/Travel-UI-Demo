import 'package:flutter/material.dart';
import 'package:ui_travel/screens/artivity_screen.dart';
import 'package:ui_travel/screens/hotels_screen.dart';
import 'package:ui_travel/widgets/side_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel UI Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/activities",
      routes: {
        ActivitiesScreen.routeName: (context) => const ActivitiesScreen(),
        HotelsScreen.routeName: (context) => const HotelsScreen(),
      },
      builder: (context, child) {
        return _TravelApp(
          // navigator: (child!.key as GlobalKey<NavigatorState>),
          child: child!,
        );
      },
    );
  }
}

class _TravelApp extends StatefulWidget {
  // final GlobalKey<NavigatorState> navigator;
  final Widget child;

  const _TravelApp({
    super.key, 
    // required this.navigator,
     required this.child});
  @override
  State<_TravelApp> createState() => __TravelAppState();
}

class __TravelAppState extends State<_TravelApp> {
  bool isOnboarding = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFF5EDDC),
      body: isOnboarding
          ? _buildOnboarding(context)
          : Row(
              children: [
                SideBar(
                  width: width,
                  height: height,
                  // navigator: widget.navigator,
                ),
                Expanded(child: widget.child)
              ],
            ),
    );
  }

  Container _buildOnboarding(context) => Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/background.png"), fit: BoxFit.cover)),
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.45,
              bottom: MediaQuery.of(context).size.height * 0.1,
              left: 30,
              right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "トラベル.com",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isOnboarding = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      padding: EdgeInsets.zero,
                      elevation: 0.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_circle_right_outlined,
                        size: 50,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "スタート",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                      )
                    ],
                  ))
            ],
          ),
        ),
      );
}
