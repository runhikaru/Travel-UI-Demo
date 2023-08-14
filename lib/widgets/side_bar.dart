import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  final double height;
  final double width;
  // final GlobalKey<NavigatorState> navigator;

  const SideBar(
      {super.key,
      required this.height,
      required this.width,
      // required this.navigator
      });

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  List<Map> menu = [
    {
      "title": "パッケージ",
      "routeName": "/activities",
    },
    {
      "title": "ホテル",
      "routeName": "/hotels",
    },
    {
      "title": "航空券",
      "routeName": "/flights",
    },
    {
      "title": "レストラン",
      "routeName": "/restaurants",
    },
  ];
  int sideBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.2,
      color: const Color(0xFF211955),
      child: Column(
        children: [
          SizedBox(
            height: widget.height * 0.05,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: menu.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return RotatedBox(
                quarterTurns: 3,
                child: TextButton(
                    style:
                        TextButton.styleFrom(minimumSize: const Size(100, 50)),
                    onPressed: () {
                      setState(() {
                        sideBarIndex = index;
                      });

                      // navigate to the new screen
                      // widget.navigator.currentState!
                      //     .pushNamed(menu[index]["routeName"]);
                    },
                    child: Text(
                      menu[index]["title"],
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: (index == sideBarIndex)
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: (index == sideBarIndex)
                              ? Colors.white
                              : Colors.white.withAlpha(200),
                          letterSpacing: 2),
                    )),
              );
            },
          ),
        ],
      ),
    );
  }
}
